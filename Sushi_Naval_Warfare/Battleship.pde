class Battleship{
 int turn;
 Board playerBoard;
 Board botBoard;
 
 Battleship(){
  turn = -1; //setting up boats
  playerBoard = new Board();
  botBoard = new BBoard();
 }
 
 void update(){
  if (turn <= 0){
   playerBoard.drawShips(); 
  }
 }
 
}
