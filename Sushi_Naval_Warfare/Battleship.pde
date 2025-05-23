class Battleship{
 int turn;
 Board playerBoard;
 Board botBoard;
 
 Battleship(){
  turn = -1; //setting up boats
  playerBoard = new Board();
  botBoard = new BBoard();
 }
 
 Board getBoard(int a){ //0 for player, 1 for bot
   if (a == 0){
     return playerBoard;
   }
   else{
    return botBoard; 
   }
 }
 
 int getTurn(){
  return turn; 
 }
}
