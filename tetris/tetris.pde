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
        board = new Board();
        keyboardInput = new Controller();
        moveCounter = 0;
        fallCd = 40;
        moveCd = 8;
        rotateCounter = 0;
        rotateCd = 20;
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
    // these variables ensure the photo is the correct aspect ratio for our processing size(600,800)
    int newWidth = 600;
    int newHeight = (int) ((float) newWidth * instructionsImage.height / instructionsImage.width);
    image(instructionsImage, 0, 200, newWidth, newHeight);

    returnButton();
  }

  // go to game page
  if (MODE.equals("play")) {
    
    
    // if the game has ended
    if (board.getEnd()){
      MODE = "death";
    }
    // background grey
    background(192);

    // print the board
    board.printBoard(100, 50);

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
  if (MODE.equals("settings")) {

    returnButton();
  }

  if (MODE.equals("setup")) {

    returnButton();
  }

  if (MODE.equals("death")) {
    // Make the current screen transparent
    background(255, 255, 255, 100);

    // Draw the death screen on top of the transparent background
    fill(255, 0, 0); // red color
    rect(width/2 - 200, height/2 - 100, 400, 200, 10); // death screen rectangle

    fill(255); // white text color
    textSize(100);
    text("Game Over!", width/2, height/2 - 30); // death screen text
    returnButton();
  }
}

void returnButton() {
  fill(0, 255, 0); // green color
  textSize(30);
  if (MODE.equals("death")) {
    rect(width/2 - 50, height/2 + 35, 100, 50, 10); // return button in the middle of death screen rectangle
    fill(0); // black text color
    text("Return", width/2, height/2 + 55); // return button label

    // check if the return button is clicked
    if (mousePressed && mouseX > width/2 - 50 && mouseX < width/2 + 50 && mouseY > height/2 + 35 && mouseY < height/2 + 70) {
      println("Return button clicked.");
      MODE = "menu"; // return to the menu page
    }
  } else {
    rect(width - 120, height - 80, 100, 50, 10); // return button in the bottom right corner
    fill(0); // black text color
    text("Return", width - 70, height - 55); // return button label

    // check if the return button is clicked
    if (mousePressed && mouseX > width - 120 && mouseX < width - 20 && mouseY > height - 80 && mouseY < height - 30) {
      println("Return button clicked.");
      MODE = "menu"; // return to the menu page
    }
  }
}


void keyPressed() {
  // if not playing, no need for keybinds
  if (!MODE.equals("play")) return; 
  
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
  // if not playing, no need for keybinds
  if (!MODE.equals("play")) return; 
  
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
