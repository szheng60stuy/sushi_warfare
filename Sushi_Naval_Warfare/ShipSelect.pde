class ShipSelect{
 PImage img;
 int drawX;
 int drawY;
 int size;
 boolean placed;
 boolean selected;
 boolean r;
 
 ShipSelect(PImage i, int x, int y, int s, boolean rotate){
  img = i;
  drawX = x;
  drawY = y;
  size = s;
  r = rotate;
 }
 
 void draw(){
   if (placed){
    tint(150, 255); 
   }
  if (r){
   rotate(PI/2);
   image(img, drawY, -drawX - squareSize);
   rotate(-PI/2);
  }
  else{
   image(img, drawX, drawY); 
  }
  tint(255);
 }
 
 void checkPressed(){
  if (r){
   if (placed == false && (mouseX > drawX && mouseX < drawX + squareSize) && (mouseY > drawY && mouseY < drawY + squareSize * size)){
     selectedShip = new ShipSelect(img, mouseX, mouseY, size, r);
     clearSelect();
     selected = true;
   }
  }
  else{
    if (placed == false && (mouseX > drawX && mouseX < drawX + squareSize * size) && (mouseY > drawY && mouseY < drawY + squareSize)){
     selectedShip = new ShipSelect(img, mouseX, mouseY, size, r);
     clearSelect();
     selected = true;
   }
  }
 }
 
 void hover(){
   if (placed == false){
     tint(255,177);
     if (r){
      rotate(PI/2);
      image(img, mouseY, -mouseX - squareSize);
      rotate(-PI/2);
     }
     else{
      image(img, mouseX, mouseY); 
     }
     tint(255);
   }
 }
 
 boolean place(){
   if (mouseX > 50 && mouseX < 850 && mouseY > 50 && mouseY < 850 && (r && mouseY + squareSize*(size - 1) < 850) || (!r && mouseX + squareSize*(size - 1) < 850)){
     Ship addShip = new Ship(mouseX, mouseY, this.size, this.r);
     if (game.playerBoard.checkBoat(addShip)){
       game.playerBoard.addShip(addShip);
       selectedShip = null;
       return true;
     }
     else{
      return false; 
     }
   }
   else{
    return false; 
   }
 }
   
}
