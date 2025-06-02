class BBoard extends Board{
 int[][] chanceBoard;
 
 BBoard(){
  super();
  chanceBoard = new int[10][10];
 }
 
 void calcChoose(){
   int maxX = 0;
   int maxY = 0;
   int max = 0;
   for (int row = 0; row < chanceBoard.length; row++){
     for (int col = 0; col < chanceBoard.length; col++){
       
     }
   }
 }
 
 void calcProbability(Ship[] ships){
   if (ships[4] != null){
     chanceBoard = new int[10][10];
     for (int row = 0; row < chanceBoard.length; row++){
       for (int col = 0; col < chanceBoard.length; col++){
         boolean[] dir = {true, true, true, true};
         for (Ship s : ships){
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
