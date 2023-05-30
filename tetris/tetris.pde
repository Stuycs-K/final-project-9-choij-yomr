Board board;
Controller keyboardInput;
int fallCd, moveCd, moveCounter;


void setup(){
  size(600, 800);
  board = new Board();
  keyboardInput = new Controller();
  moveCounter = 0;
  fallCd = 40;
  moveCd = 10;
}

void draw() {
  background(192);
  board.printBoard(100,50);
  if (keyboardInput.isMoving()){
    if (moveCounter % moveCd == 0){
      if (keyboardInput.isPressed(Controller.myLEFT)) {
        board.movePiece(-1);
      }
      if (keyboardInput.isPressed(Controller.myRIGHT)) {
        board.movePiece(1);  
      }
     
      
    }
    moveCounter++;
  }
  if (keyboardInput.isPressed(Controller.myDOWN)){
    fallCd = 10;
  } else {
    fallCd = 40;
  }
  board.tick(fallCd);
  
  
}

void keyPressed(){
  if (key == CODED){
    keyboardInput.press(keyCode);
  } else {
    keyboardInput.press(key);
  }
  if (key == ' '){ // this is here because it is a one time thing, releasing space does nothing
    board.fallDownAll(); // no need for true and false in controller
  }
}

void keyReleased(){
  if (key == CODED){
    if (keyCode == DOWN){
      board.resetFallCounter(); // if u release down, the fallCounter should be reset, one time thing
    }
    keyboardInput.release(keyCode);
    moveCounter = 0;
  } else {
    keyboardInput.release(key);
  }
  
}
