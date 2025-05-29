class Battleship{
 int turn;
 Board playerBoard;
 BBoard botBoard;
 
 Battleship(){
  turn = -2; //setting up boats
  playerBoard = new Board();
  botBoard = new BBoard();
 }
 
 void update(){
  if (turn < 0){
    if (turn == -2){
      this.botBoard.setBotBoard();
      turn++;
    }
    if (playerBoard.len == 5){
      turn++;
    }
  }
  if (turn != 0){
    playerBoard.drawShips();
  }
  if (turn == 1){
   if (!game.botBoard.sink(gridTranslate((int)random(50, 850)), gridTranslate((int)random(50, 850)))){
      game.turn++;
   } 
  }
 }
 
 
}
