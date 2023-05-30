class Controller {
  static final int myLEFT = 0;
  static final int myRIGHT = 1;
  static final int myDOWN = 2;
  static final int ROTATE_LEFT = 3;
  static final int ROTATE_RIGHT = 4;
  boolean [] inputs;
  boolean movement;

  public Controller() {
    inputs = new boolean[5];
    
  }

  boolean isPressed(int code) {
    return inputs[code];
  }
  
  boolean isMoving(){
    return inputs[myLEFT] || inputs[myRIGHT];
  }
  
  boolean isRotating(){
    return inputs[ROTATE_LEFT] || inputs[ROTATE_RIGHT];
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
    if (code == 'z'){
      inputs[ROTATE_LEFT] = true;
    }
    if (code == 'x'){
      inputs[ROTATE_RIGHT] = true;
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
    if (code == 'z'){
      inputs[ROTATE_LEFT] = false;
    }
    if (code == 'x'){
      inputs[ROTATE_RIGHT] = false;
    }
  }
}
