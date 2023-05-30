Board board;
Controller keyboardInput;
int counter, fallCd, moveCd, moveCounter;


void setup(){
  size(600, 800);
  board = new Board();
  keyboardInput = new Controller();
  counter = 0;
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
  
  
  counter +=1;
  
  
}

void keyPressed(){
  if (key == CODED){
    keyboardInput.press(keyCode);
  } else {
    keyboardInput.press(key);
  }
}

void keyReleased(){
  if (key == CODED){
    keyboardInput.release(keyCode);
    moveCounter = 0;
  } else {
    keyboardInput.release(key);
  }
}
