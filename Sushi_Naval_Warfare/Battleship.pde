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
  if (turn <= 0){
    if (turn == -2){
      this.botBoard.setBotBoard();
      turn++;
    }
    playerBoard.drawShips();
    //botBoard.drawShips();
  }
 }
 
}
