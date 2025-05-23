class Ship{
 PVector[] location;
 int size;
 boolean isAlive;
 
 Ship(int x, int y, int size){
  size = size;
  location = new PVector[size];
  location[0].x = x;
  location[0].y = y;
  isAlive = true;
 }
 
 void drawShip(){
   
 }
 
 PVector[] getLocation(){
   return location;
 }
 
 boolean getIsAlive(){
  return isAlive; 
 }
 
}
