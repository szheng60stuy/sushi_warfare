class Battleship{
 int turn;
 Board playerBoard;
 BBoard botBoard;
 int delayMark;
 boolean over;
 
 Battleship(){
  turn = -2; //setting up boats
  playerBoard = new Board();
  botBoard = new BBoard();
 }
 
 
 /*turn
 -2 : setting up boats + botBoard set up
 -1 : setting up boats
 0 : player's turn shooting at bot boats
 1 : bot turn shooting at player boats
 2: player shot boat ; pause
 3: bot shot boat ; pause
 */
 
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
  if (turn != 0 && turn != 2){
    playerBoard.drawShips();
  }
  if (turn == 0 || turn == 2){
    for (Ship s : game.botBoard.ships){
            s.checkAlive(game.botBoard);
     }
    botBoard.drawCookedShips();
  }
  if (turn == 1 && !over){
    PVector loc = botBoard.calcChoose();
   if (frameCount - delayMark > 100 && !game.playerBoard.sink(loc)){
      game.turn = 3;
      delayMark = frameCount;
      for (Ship s : playerBoard.ships){
        s.checkAlive(playerBoard);
      }
   } 
  }
  if (turn == 2){
    if (frameCount - delayMark > 100){
      turn = 1;
      delayMark = frameCount;
    }
  }
  if (turn == 3){
    if (frameCount - delayMark > 100){
      turn = 0;
    }
  }
  if (turn >= 0 && playerBoard.checkAlive() == false){
    over = true;
    fill(0);
    textSize(30);
    text("Bot Won!", 35, 35);
  }
  if (turn >= 0 && botBoard.checkAlive() == false){
    over = true;
    fill(0);
    textSize(30);
    text("You Won!", 35, 35);
  }
 }
 
}
