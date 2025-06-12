class BBoard extends Board{
 int[][] chanceBoard;
 ArrayList<PVector> marked;
 
 BBoard(){
  super();
  chanceBoard = new int[10][10];
  marked = new ArrayList<PVector>();
 }
 
 PVector calcChoose(){
   for (Ship s : game.playerBoard.ships){
        s.checkAlive(game.playerBoard);
   }
   calcProbability();
   PVector result;
   if (marked.size() > 0){
     result = calcRandom(markAdjacents());
   }
   else{
     result = calcRandom(findMax());
   }
   return translateToCoord(result);
 }
 
 ArrayList<PVector> markAdjacents(){
   ArrayList<PVector> maxes = new ArrayList<PVector>();
   if (marked.size() == 1){
     PVector mark = marked.get(0);
     //println(mark);
     PVector[] dir = new PVector[4]; // up down right left
     if (mark.x > 0){
       dir[0] = new PVector(mark.x - 1, mark.y);
     }
     if (mark.x < 9){
       dir[1] = new PVector(mark.x + 1, mark.y);
     }
     if (mark.y < 9){
       dir[2] = new PVector(mark.x, mark.y + 1);
     }
     if (mark.y > 0){
       dir[3] = new PVector(mark.x, mark.y - 1);
     }
     int high = 0;
     for (PVector direction : dir){
       if (direction != null){
         //println("dir: " + direction);
         int val = chanceBoard[(int)mark.y][(int)mark.x];
         if (val > high){
           high = val;
           maxes = new ArrayList<PVector>();
           maxes.add(direction);
         }
         if (val == high){
           maxes.add(direction);
         }
       }
     }
   }
   else{
     PVector head = marked.get(0);
     PVector tail = marked.get(marked.size() - 1);
     PVector wayOne = null;
     PVector wayTwo = null;
     println(marked);
     for (PVector mark : marked){
       if (mark.x < head.x || mark.y < head.y){
         head = mark;
       }
       else if (mark.x > tail.x || mark.y > tail.y){
         tail = mark;
       }
     }
     println("head: " + head);
     println("tail: " + tail);
     if (head != null && tail != null && head.x == tail.x){
       if (head.y > 0){
         wayOne = new PVector(head.x, head.y - 1);
       }
       if (tail.y < 9){
         wayTwo = new PVector(tail.x, tail.y + 1);
       }
     }
     else if (head != null && tail != null && head.y == tail.y){
       if (head.x > 0){
         wayOne = new PVector(head.x - 1, head.y);
       }
       if (tail.x < 9){
         wayTwo = new PVector(tail.x + 1, tail.y);
       }
     }
     println("wayOne: " + wayOne);
     println("wayTwo: " + wayTwo);
     if (wayOne != null && (wayTwo == null || chanceBoard[(int)wayOne.x][(int)wayOne.y] > chanceBoard[(int)wayTwo.x][(int)wayTwo.y])){
       maxes.add(wayOne);
     }
     else if (wayTwo != null){
       maxes.add(wayTwo);
     }
   }
   println(maxes);
   printCBoard();
   return maxes;
 }
 
 PVector translateToCoord(PVector p){
   float a = p.y;
   p.y = p.x * squareSize + 50;
   p.x = a * squareSize + 50;
   return p;
 }
 
 PVector calcRandom(ArrayList<PVector> list){
   return list.get((int)random(list.size()));
 }
 
 ArrayList<PVector> findMax(){
   ArrayList<PVector> result = new ArrayList<PVector>();
   int max = 0;
   for (int row = 0; row < chanceBoard.length; row++){
     for (int col = 0; col < chanceBoard.length; col++){
       if (chanceBoard[row][col] == max){
         result.add(new PVector(row, col));
       }
       if (chanceBoard[row][col] > max){
         max = chanceBoard[row][col];
         result = new ArrayList<PVector>();
         result.add(new PVector(row, col));
       }
     }
   }
   return result;
 }
 
 void calcProbability(){
   if (len == 5){
     chanceBoard = new int[10][10];
     for (int row = 0; row < chanceBoard.length; row++){
       for (int col = 0; col < chanceBoard.length; col++){
         if (game.playerBoard.board[row][col] < 0){
           chanceBoard[row][col] = 0;
         }
         else{
             boolean[] dir = {true, true, true, true};
             for (Ship s : game.playerBoard.ships){
               if (s.isAlive){
                 if (dir[0] && (row - s.size + 1 >= 0) && game.playerBoard.board[row - s.size + 1][col] >= 0){
                   chanceBoard[row][col] += 1;
                 }
                 else{
                  dir[0] = false; 
                 }
                 if (dir[1] && (col + s.size - 1 < game.playerBoard.board[row].length) && game.playerBoard.board[row][col + s.size - 1] >= 0){
                   chanceBoard[row][col] += 1;
                 }
                 else{
                  dir[1] = false; 
                 }
                 if (dir[2] && (row + s.size - 1 < game.playerBoard.board.length) && game.playerBoard.board[row + s.size - 1][col] >= 0){
                   chanceBoard[row][col] += 1;
                 }
                 else{
                  dir[2] = false; 
                 }
                 if (dir[3] && (col - s.size + 1 >= 0) && game.playerBoard.board[row][col - s.size + 1] >= 0){
                   chanceBoard[row][col] += 1;
                 }
                 else{
                  dir[3] = false; 
                 }
               }
             }
         }
       }
     }
   }
 }
 
 void setBotBoard(){
   int[] sizes = {2, 3, 3, 4, 5};
   for (int s : sizes){
     Ship addShip = tryShip(s);
     while (!game.botBoard.checkBoat(addShip)){
       addShip = tryShip(s);
     }
     game.botBoard.addShip(addShip);
   }
 }
 
 Ship tryShip(int s){
   int rotNum = (int)random(2);
   if (rotNum == 0){
     return new Ship((int)random(50, 770), (int)random(50, 770), s, false);
   }
   else{
     return new Ship((int)random(50, 770), (int)random(50, 770), s, true);
   } 
 }
}
