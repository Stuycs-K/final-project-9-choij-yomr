Board board;
Controller keyboardInput;

void setup(){
  size(600, 800);
  board = new Board();
  keyboardInput = new Controller();
}

void draw() {
  background(192);
  board.printBoard(100,50);
  
  if (keyboardInput.isPressed(Controller.myLEFT)) {
     board.movePiece(-1);
  }
  if (keyboardInput.isPressed(Controller.myRIGHT)) {
     board.movePiece(1);
  }
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
  } else {
    keyboardInput.release(key);
  }
}
