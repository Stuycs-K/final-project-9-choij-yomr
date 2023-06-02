String MODE = "menu";
boolean buttonClicked = false;
PImage titleImage;
PImage instructionsImage;
PFont mono;
Board board;
Controller keyboardInput;
int fallCd, moveCd, moveCounter, rotateCd, rotateCounter;
boolean paused = false;

void setup() {
  size(600, 800);

  mono = createFont("tetrisFont.ttf", 18);
  textFont(mono);
  textAlign(CENTER, CENTER); // center text alignment
  textSize(40); // text size

  titleImage = loadImage("tetrisTitle.jpg");
  instructionsImage = loadImage("instructions.png");


  board = new Board();
  keyboardInput = new Controller();
  moveCounter = 0;
  fallCd = 40;
  moveCd = 8;
  rotateCounter = 0;
  rotateCd = 20;
}

void draw() {
  background(255); // white background


  if (MODE.equals("menu")) {
    textSize(40); // text size
    // title image
    titleImage.resize(0, 200);
    image(titleImage, 0, 50);

    // vertical positions for buttons
    int buttonSpacing = 80;
    int buttonY = 300;

    // menu buttons
    noStroke();

    fill(255, 0, 0); // red color
    rect((width - 400) / 2, buttonY, 400, 50, 100);  // play button

    fill(255, 165, 0); // orange color
    rect((width - 400) / 2, buttonY + buttonSpacing, 400, 50, 100);  // settings button

    fill(255, 255, 0); // yellow color
    rect((width - 400) / 2, buttonY + 2 * buttonSpacing, 400, 50, 100);  // instructions button

    fill(0, 255, 0); // green color
    rect((width - 400) / 2, buttonY + 3 * buttonSpacing, 400, 50, 100);  // setup button

    // button labels
    fill(0); // black text color
    text("Play", width / 2, buttonY + 25); // play label
    text("Settings", width / 2, buttonY + buttonSpacing + 25); // settings label
    text("Instructions", width / 2, buttonY + 2 * buttonSpacing + 25); // instructions label
    text("Setup", width / 2, buttonY + 3 * buttonSpacing + 25); // setup label

    // check for button clicks
    if (mousePressed && !buttonClicked) {
      // check if click falls within button
      if (mouseX > (width - 400) / 2 && mouseX < (width - 400) / 2 + 400 && mouseY > buttonY && mouseY < buttonY + 50) {
        //println("Play button clicked.");
        MODE = "play";
      } else if (mouseX > (width - 400) / 2 && mouseX < (width - 400) / 2 + 400 && mouseY > buttonY + buttonSpacing && mouseY < buttonY + buttonSpacing + 50) {
        //println("Settings button clicked.");
        MODE = "settings";
      } else if (mouseX > (width - 400) / 2 && mouseX < (width - 400) / 2 + 400 && mouseY > buttonY + 2 * buttonSpacing && mouseY < buttonY + 2 * buttonSpacing + 50) {
        //println("Instructions button clicked.");
        MODE = "instructions";
      } else if (mouseX > (width - 400) / 2 && mouseX < (width - 400) / 2 + 400 && mouseY > buttonY + 3 * buttonSpacing && mouseY < buttonY + 3 * buttonSpacing + 50) {
        //println("Setup button clicked.");
        MODE = "setup";
      }
      buttonClicked = true;
    } else if (!mousePressed) {
      buttonClicked = false;
    }
  }

  // go to instructions page
  if (MODE.equals("instructions")) {
    instructionsImage.resize(2000, 2000);
    image(instructionsImage, 0, 0, width, height);
    
    returnButton();
  }

  // go to game page
  if (MODE.equals("play")) {

    // background grey
    background(192);

    // print the board
    board.printBoard(100, 80);

    // checking for inputs for moving piece left and right
    if (keyboardInput.isMoving()) {
      if (moveCounter % moveCd == 0) {
        if (keyboardInput.isPressed(Controller.myLEFT)) {
          board.movePiece(-1);
        }
        if (keyboardInput.isPressed(Controller.myRIGHT)) {
          board.movePiece(1);
        }
      }
      moveCounter++;
    }

    // checking for inputs for moving piece down
    if (keyboardInput.isPressed(Controller.myDOWN)) {
      fallCd = 5;
    } else {
      fallCd = 40;
    }

    // checking for inputs for piece rotation
    if (keyboardInput.isRotating()) {
      if (rotateCounter % rotateCd == 0) {
        if (keyboardInput.isPressed(Controller.ROTATE_LEFT)) {
          board.rotateLeft();
        }
        if (keyboardInput.isPressed(Controller.ROTATE_RIGHT)) {
          board.rotateRight();
        }
      }
      rotateCounter++;
    }

    // one tick of falling
    board.fallTick(fallCd);

    // clearing all lines that can be cleared
    for (int i = 0; i < 22; i++) {
      board.clearLine(i);
    }
    
    returnButton();
    
  }
  
  // go to settings page
  if (MODE.equals("settings")){
    
    returnButton();
  }
  
  if (MODE.equals("setup")){
    
    returnButton();
  }
  
}

void returnButton(){
  fill(0, 255, 0); // green color
    textSize(30);
    rect(width - 120, height - 80, 100, 50, 10); // return button
    fill(0); // black text color
    text("Return", width - 70, height - 55); // return button label

    // check if the return button is clicked
    if (mousePressed && mouseX > width - 120 && mouseX < width - 20 && mouseY > height - 80 && mouseY < height - 30) {
      println("Return button clicked.");
      MODE = "menu"; // return to the menu page
    }
}


void keyPressed() {
  if (key == CODED) {
    keyboardInput.press(keyCode);
  } else {
    keyboardInput.press(key);
  }
  // hard fall, no need for controller
  if (key == ' ') {
    board.fallDownAll();
  }
  //swapping with hold
  if (key == 'c') {
    board.swapHold();
  }
  //pausing
  if (key == 'p') {
    if (paused) {
      loop();
      paused = false;
    } else {
      noLoop();
      paused = true;
      textSize(20);
      fill(0);
      text("PAUSED", width/2 - 32, 50);
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    // releasing down resets the fall counter to make the game more consistent
    if (keyCode == DOWN) {
      board.resetFallCounter();
    }
    keyboardInput.release(keyCode);
    moveCounter = 0;
  } else {

    keyboardInput.release(key);

    //releasing stops rotate
    if (key == 'z' || key == 'x') {
      rotateCounter = 0;
    }
  }
}
