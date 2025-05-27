class BBoard extends Board{
 int[][] chanceBoard;
 
 BBoard(){
  super();
  chanceBoard = new int[10][10];
 }
 
 void calcProbability(Ship[] ships){
   chanceBoard = new int[10][10];
   for (int row = 0; row < chanceBoard.length; row++){
     for (int col = 0; col < chanceBoard[row].length; col++){
       boolean[] dir = {true, true, true, true}; //up, right, down, left
       for (int i = 0; i < ships.length; i++){
         if (dir[0] && (row - s.size >= 0) && game.playerBoard[row - s.size][col] >= 0){
           chanceBoard[row][col] += 1;
         }
         else{
          dir[0] = false; 
         }
         if (dir[1] && (col + s.size < 10) && game.playerBoard[row - s.size][col] >= 0){
           chanceBoard[row][col] += 1;
         }
         else{
          dir[0] = false; 
         }
       }
     }
   }
}
