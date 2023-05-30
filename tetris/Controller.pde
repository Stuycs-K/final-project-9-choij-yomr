class Controller {
  static final int myLEFT = 0;
  static final int myRIGHT = 1;
  static final int myDOWN = 2;
  boolean [] inputs;
  boolean movement;

  public Controller() {
    inputs = new boolean[3];
  }

  boolean isPressed(int code) {
    return inputs[code];
  }
  boolean isMoving(){
    return inputs[myLEFT] || inputs[myRIGHT];
  }

  void press(int code) {
    if (key == CODED){
      if (code == LEFT)
        inputs[myLEFT] = true;
      if(code == RIGHT)
        inputs[myRIGHT] = true;
      if(code == DOWN)
        inputs[myDOWN] = true;
    }
    
  }
  void release(int code) {
    if (key == CODED){
      if (code == LEFT)
        inputs[myLEFT] = false;
      if(code == RIGHT)
        inputs[myRIGHT] = false;
      if(code == DOWN)
        inputs[myDOWN] = false;
    }
  }
}
