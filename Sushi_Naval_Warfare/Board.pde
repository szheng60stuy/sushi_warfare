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
   ships[ind] = newShip;
   for(int i = 0; i < ships[ind].size; i++){
     int bX = (int)(ships[ind].location[i].x - 50) / squareSize;
     int bY = (int)(ships[ind].location[i].y - 50) / squareSize;
     board[bY][bX] += 1;
   }
 }
 
 boolean checkBoat(Ship tryShip){
   for (PVector l : tryShip.location){
     if(!checkSpot(l.x, l.y)){
       return false;
     }
   }
   return true;
 }
 
 boolean checkSpot(float x, float y){
   int bX = (int)(x - 50) / squareSize;
   int bY = (int)(y - 50) / squareSize;
   return board[bY][bX] == 0;
 }
 
 boolean sink(int x, int y){
   return false; //true if hit a ship, false if miss
 }
}
