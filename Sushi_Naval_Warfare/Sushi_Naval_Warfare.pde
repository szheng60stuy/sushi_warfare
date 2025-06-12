Battleship game;
int squareSize;
color backColor;
color shipColor;
ArrayList<PVector> boomedPlayer;
ArrayList<PVector> boomedBot;
ArrayList<Slash> slashes;
ShipSelect[] shipSelects;
ShipSelect selectedShip;
PImage back;
PImage sea;

void setup(){
 size(1200, 900);
 frameRate(60);
 squareSize = 80;
 game = new Battleship();
 boomedPlayer = new ArrayList<PVector>();
 boomedBot = new ArrayList<PVector>();
 slashes = new ArrayList<Slash>();
 shipSelects = new ShipSelect[5];
 shipSelects[0] = new ShipSelect(loadImage("twoShipSelect.png"), 900, 50, 2, false);
 shipSelects[1] = new ShipSelect(loadImage("threeShipSelect.png"), 900, 150, 3, true);
 shipSelects[2] = new ShipSelect(loadImage("threeShipSelect.png"), 1000, 150, 3, true);
 shipSelects[3] = new ShipSelect(loadImage("fourShipSelect.png"), 900, 400, 4, true);
 shipSelects[4] = new ShipSelect(loadImage("fiveShipSelect.png"), 1000, 400, 5, true);
 back = loadImage("back.png");
 back.resize(1200, 900);
 sea = loadImage("sea.png");
}

void draw(){
 background(color(0));
 image(back, 0, 0);
 image(sea, 50, 50);
 grid();
 //printMouseLocations();
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
 if (game.turn == 0 || game.turn == 2){
   boomGrid(boomedBot, game.botBoard);
 }
 if (game.turn == 1 || game.turn == 3){
   boomGrid(boomedPlayer, game.playerBoard);
 }
 highlight();
 for (Slash s : slashes){
   s.draw();
 }
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

//50, 770
void grid(){
 for (int r = 50; r < 850; r += squareSize){
   line(r, 50, r, 850);
 }
 for (int r = 50; r < 850; r += squareSize){
   line(50, r , 850, r);
 }
}

void boomGrid(ArrayList<PVector> boomed, Board b){
  for (PVector l : boomed){
    int bX = (int)(l.x - 50) / squareSize;
    int bY = (int)(l.y - 50) / squareSize;
    if (b.board[bY][bX] == -2){
      fill(100, 10, 10, 150);
    }
    else{
      fill(10, 10, 10, 100);
    }
    rect(l.x, l.y, squareSize, squareSize);
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

void printPBoard(){
 for (int[] row : game.playerBoard.board){
  for (int c : row){
   print(c + " "); 
  }
  println("");
 }
 println("");
}

void printBBoard(){
 for (int[] row : game.botBoard.board){
  for (int c : row){
   print(c + " "); 
  }
  println("");
 }
 println("");
}

void printCBoard(){
  if (game.playerBoard.len == 5){
   game.botBoard.calcProbability();
  }
 for (int[] row : game.botBoard.chanceBoard){
  for (int c : row){
   print(c + " "); 
  }
  println("");
 }
 println("");
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
      if (selectedShip.place()){
        for (ShipSelect s : shipSelects){
          if (s.selected){
            s.placed = true;
            s.selected = false;
          }
        }
      }
     }
   }
   if (game.turn == 0){
     if (mouseX > 50 && mouseX < 850 && mouseY > 50 && mouseY < 850){
       if (!game.over && !game.botBoard.sink(new PVector(gridTranslate(mouseX), gridTranslate(mouseY)))){
          game.turn = 2;
          game.delayMark = frameCount;
       }
     }
   }
 }
}

void clearSelect(){
 for (ShipSelect s: shipSelects){
  s.selected = false;
 }
}

void keyPressed(){
 if (key == 'x'){
  selectedShip = null;
  println(game.botBoard.marked);
 }
 if (key == 'c'){
   printCBoard();
 }
 if (key == 'b'){
   printBBoard();
 }
 if (key == 'p'){
   printPBoard();
 }
 if (key == 'r'){
  if (selectedShip != null){
     if (selectedShip.r == true){
      selectedShip.r = false; 
     }
     else{
      selectedShip.r = true; 
     }
  }
 }
}
