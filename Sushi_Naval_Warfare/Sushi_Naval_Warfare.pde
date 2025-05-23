Battleship game;
int squareSize;

void setup(){
 size(900, 900); 
 squareSize = 80;
 game = new Battleship();
}

void draw(){
 fill(0);
 int lineX = 50;
 int lineY = 50;
 for (int i = 0; i <= 10; i++){
  line(lineX, lineY, lineX, height - 50);
  lineX += squareSize;
 }
 lineX = 50;
 for (int i = 0; i <= 10; i++){
  line(lineX, lineY, width - 50, lineY);
  lineY += squareSize;
 }
}

void hightlight(){
  
}
