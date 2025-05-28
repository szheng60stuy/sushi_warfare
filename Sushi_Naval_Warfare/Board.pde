class Board{
 int[][] board;
 Ship[] ships; //2, 3, 3, 4, 5
 int len;
 
 Board(){
  board = new int[10][10];
  ships = new Ship[5];
 }
 
 int getVal(float x, float y){
   int bX = (int)(x - 50) / squareSize;
   int bY = (int)(y - 50) / squareSize;
   return board[bY][bX];
 }
 
 void drawShips(){
  for (Ship ship: ships){
   if (ship != null){
    ship.drawShip();
   }
  }
 }
 
 void addShip(Ship newShip){
   int ind = newShip.size - 1;
   if (ind == 1 || (ind == 2 && ships[1] == null)){
     ind--;
   }
   ships[ind] = newShip;
   for(int i = 0; i < ships[ind].size; i++){
     int bX = (int)(ships[ind].location[i].x - 50) / squareSize;
     int bY = (int)(ships[ind].location[i].y - 50) / squareSize;
     board[bY][bX] += 1;
   }
   len++;
 }
 
 boolean checkBoat(Ship tryShip){
   for (PVector l : tryShip.location){
     if(l.x < 50 || l.x > 770 || l.y < 50 || l.y > 770 || !checkSpot(l.x, l.y)){
       return false;
     }
   }
   return true;
 }
 
 boolean checkSpot(float x, float y){
   return getVal(x, y) == 0;
 }
 
 boolean sink(int x, int y){
   int bX = (int)(x - 50) / squareSize;
   int bY = (int)(y - 50) / squareSize;
   int v = getVal(x, y);
   if (v >= 0){
     if (v == 1){
       this.board[bY][bX] = -2;
       return true;
     }
     this.board[bY][bX] = -1;
     return false;
   }
   return false;
 }
}
