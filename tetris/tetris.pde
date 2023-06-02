Board board;
Controller keyboardInput;
int fallCd, moveCd, moveCounter, rotateCd, rotateCounter;
boolean paused;


void setup(){
  size(600, 800);
  board = new Board();
  keyboardInput = new Controller();
  moveCounter = 0;
  fallCd = 40;
  moveCd = 8;
  rotateCounter = 0;
  rotateCd = 20;
}

void draw() {
  background(192);
  board.printBoard(100,80);
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
    fallCd = 5;
  } else {
    fallCd = 40;
  }
  if (keyboardInput.isRotating()){
    if (rotateCounter % rotateCd == 0){
      if (keyboardInput.isPressed(Controller.ROTATE_LEFT)) {
        board.rotateLeft();
      }
      if (keyboardInput.isPressed(Controller.ROTATE_RIGHT)) {
        board.rotateRight();  
      }
     
      
    }
    rotateCounter++;
  }
  
  board.fallTick(fallCd);
  for (int i = 0; i < 22; i++){
    board.clearLine(i);
  }
  
  
  
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
  if (key == 'c'){ // one time thing
    board.swapHold(); // boolean already in board preventing holding
  }
  if (key == 'p') {
    if (paused){
      loop();
      paused = false;
    } else{
      noLoop();
      paused = true;
      textSize(20);
      fill(0);
      text("PAUSED", width/2 - 32, 50);
    }
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
    if (key == 'z' || key == 'x'){
      rotateCounter = 0;
    }
    
  }
  
  
}
