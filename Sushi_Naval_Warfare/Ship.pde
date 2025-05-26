class Ship{
 PVector[] location;
 int size;
 boolean isAlive;
 PImage[] imgs;
 boolean r;
 
 Ship(int x, int y, int siz, boolean rot){
  size = siz;
  r = rot;
  location = new PVector[size];
  for (int i = 0; i < size; i++){
   if (r){
    location[i] = new PVector(gridTranslate(x), gridTranslate(y) + squareSize * i); 
   }
   else{
    location[i] = new PVector(gridTranslate(x) + squareSize * i, gridTranslate(y));  
   }
  }
  isAlive = true;
  imgs = new PImage[size];
  if (size == 2){
   imgs[0] = loadImage("twoShipOne.png");
   imgs[1] = loadImage("twoShipTwo.png"); 
  }
 }
 
 void drawShip(){
   for (int i = 0; i < size; i++){
     if (r){
       rotate(PI/2);
       image(imgs[i], location[i].y, -1 * location[i].x - squareSize); 
       rotate(-PI/2);
     }
     else{
       image(imgs[i], location[i].x, location[i].y);
     } 
   }
 }
 
 
}
