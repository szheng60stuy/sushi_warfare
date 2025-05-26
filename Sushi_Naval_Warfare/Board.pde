class Board{
 int[][] board;
 Ship[] ships; //2, 3, 3, 4, 5
 
 Board(){
  board = new int[10][10];
  ships = new Ship[5];
 }
 
 int getVal(int x, int y){
  return board[x][y];
 }
 
 void drawShips(){
  for (Ship ship: ships){
   if (ship != null){
    ship.drawShip();
   }
  }
 }
 
 void addShip(Ship newShip){
   int ind = 0;
   while (ships[ind] != null){
    ind++; 
   }
   print(ind);
   ships[ind] = newShip;
 }
 
 boolean sink(int x, int y){
   return false; //true if hit a ship, false if miss
 }
}
