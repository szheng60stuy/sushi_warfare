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
  if (size == 3){
   imgs[0] = loadImage("twoShipOne.png");
   imgs[1] = loadImage("shipBody.png");
   imgs[2] = loadImage("twoShipTwo.png"); 
  }
  if (size == 4){
   imgs[0] = loadImage("twoShipOne.png");
   imgs[1] = loadImage("shipBody.png");
   imgs[2] = loadImage("shipBody.png");
   imgs[3] = loadImage("twoShipTwo.png"); 
  }
  if (size == 5){
   imgs[0] = loadImage("twoShipOne.png");
   imgs[1] = loadImage("shipBody.png");
   imgs[2] = loadImage("shipBody.png");
   imgs[3] = loadImage("shipBody.png");
   imgs[4] = loadImage("twoShipTwo.png"); 
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
 
 boolean checkAlive(Board b){
   if (isAlive){
     for (PVector l : location){
       if (b.getVal(l.x, l.y) != -2){
         return true;
       }
     }
     if (game.turn == 1){
       for (PVector l : this.location){
         int row = (int)(l.y - 50)/squareSize;
         int col = (int)(l.x - 50)/squareSize;
         for(int i = 0; i < game.botBoard.marked.size(); i++){
           PVector mark = game.botBoard.marked.get(i);
           if (row == mark.x && col == mark.y){
             game.botBoard.marked.remove(i);
           }
         }
       }
     }
   }
   isAlive = false;
   return false;
 }
}
