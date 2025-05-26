Battleship game;
int squareSize;
color backColor;
color shipColor;
ShipSelect[] shipSelects;
ShipSelect selectedShip;

void setup(){
 size(1200, 900); 
 squareSize = 80;
 backColor = color(162, 164, 165);
 shipColor = color(6, 180, 240);
 game = new Battleship();
 shipSelects = new ShipSelect[5];
 shipSelects[0] = new ShipSelect(loadImage("twoShipSelect.png"), 900, 50, 2, false);
 shipSelects[1] = new ShipSelect(loadImage("twoShipSelect.png"), 900, 300, 2, true);
}

void draw(){
  background(backColor);
 grid();
 printMouseLocations();
 for (ShipSelect s: shipSelects){
   if (s != null){
       s.draw();  
   }
 }
 if (selectedShip != null){
   fill(0);
   textSize(30);
   text("Press x to unselect", 35, 35);
   selectedShip.hover(); 
 }
 game.update();
 highlight();
}

//not necessary for the game, just for convenience while coding
void printMouseLocations(){
 println("");
 println("");
 println("");
 println("");
 println("");
 println("x: " + mouseX + ", y: " + mouseY);
}

void grid(){
 int lineX = 50;
 int lineY = 50;
 fill(shipColor);
 rect(lineX, lineY, squareSize * 10, squareSize * 10);
 fill(0);
 for (int i = 0; i <= 10; i++){
  line(lineX, lineY, lineX, height - 50);
  lineX += squareSize;
 }
 lineX = 50;
 for (int i = 0; i <= 10; i++){
  line(lineX, lineY, width - 350, lineY);
  lineY += squareSize;
 } 
}

void highlight(){
  if (mouseX > 50 && mouseX < 850 && mouseY > 50 && mouseY < 850){
    fill(255, 255, 255, 50);
    int highX = gridTranslate(mouseX);
    int highY = gridTranslate(mouseY);
    rect(highX, highY, 80, 80);
  }
}

int gridTranslate(int n){
  return (n - 50) / 80 * 80 + 50;
}

void mouseClicked(){
 if (mouseButton == LEFT){
   if (game.turn == -1){
     for (ShipSelect s : shipSelects){
      if (s != null){
       s.checkPressed();  
      }
     }
     if (selectedShip != null){
      selectedShip.place();
     }
   }
 }
}

void keyPressed(){
 if (key == 'x'){
  selectedShip = null; 
 }
}
