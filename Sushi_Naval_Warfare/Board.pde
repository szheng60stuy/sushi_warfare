class Board{
 int[][] board;
 Ship[] ships; //2, 3, 3, 5
 
 Board(){
  board = new int[10][10];
  ships = new Ship[4];
 }
 
 int getVal(int x, int y){
  return board[x][y];
 }
 
 void drawShips(){
  for (Ship ship: ships){
   ship.drawShip(); 
  }
 }
 
 boolean sink(int x, int y){
   return false; //true if hit a ship, false if miss
 }
}
