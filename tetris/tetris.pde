String MODE = "menu";
boolean buttonClicked = false;
PImage titleImage;
PImage instructionsImage;
PFont mono;
Board board;
Controller keyboardInput;
int fallCd, moveCd, moveCounter, rotateCd, rotateCounter;
boolean paused = false;
int buttonSpacing = 80;
int buttonY = 300;
String difficulty = "normal";
float musicSliderX = 200;
float sfxSliderX = 200;
boolean isDraggingMusicSlider = false;
boolean isDraggingSFXSlider = false;
boolean isButtonOn = false;

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
  textSize(40); // text size
  if (MODE.equals("menu")) {
    // title image
    titleImage.resize(0, 200);
    image(titleImage, 0, 50);

    // menu buttons
    noStroke();

    fill(216, 103, 103); // red color
    rect((width - 400) / 2, buttonY, 400, 50, 100);  // play button

    fill(144, 216, 103); // green color
    rect((width - 400) / 2, buttonY + buttonSpacing, 400, 50, 100);  // settings button

    fill(224, 148, 25); // orange color
    rect((width - 400) / 2, buttonY + 2 * buttonSpacing, 400, 50, 100);  // instructions button

    fill(149, 47, 234); // purple color
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
        board = new Board(0);
        keyboardInput = new Controller();
        moveCounter = 0;
        fallCd = 40;
        moveCd = 8;
        rotateCounter = 0;
        rotateCd = 20;
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


  // go to game page
  if (MODE.equals("play")) {
    
    // if the game has ended
    if (board.getEnd()){
      MODE = "death";
    }

    // background grey
    background(169);

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
    
    // settings page
    textSize(80);
    textAlign(CENTER, CENTER);
    text("Settings", width/2, 50);
  
    // music volume slider
    fill(224, 148, 25); // orange color
    rect(200, 150, 240, 40, 20); // music volume rectangle
  
    fill(0); // black color
    textSize(20);
    textAlign(LEFT, CENTER);
    text("Music Volume:", 100, 165); // music volume label
  
    if (mousePressed && mouseX > 200 && mouseX < 440 + musicSliderX && mouseY > 150 && mouseY < 190) {
      musicSliderX = constrain(mouseX, 200, 440 + musicSliderX);
    }
  
    // calculate the width of the blue rectangle based on the slider position
    float musicSliderWidth = musicSliderX - 200;
    musicSliderWidth = constrain(musicSliderWidth, 0, 240); // clamp the width of the blue rectangle
  
    fill(48, 173, 206); // Blue color
    rect(200, 150, musicSliderWidth, 40, 20); // music volume slider
  
    fill(0); // Black color
    textAlign(CENTER, CENTER);
    text(int(map(musicSliderWidth, 0, 240, 0, 100) + 0.5) + "%", 320, 165); // current music volume
  
    // SFX volume slider
    fill(224, 148, 25); // orange color
    rect(200, 225, 240, 40, 20); // SFX volume rectangle
  
    fill(0); // black color
    textSize(20);
    textAlign(LEFT, CENTER);
    text("SFX Volume:", 100, 240); // SFX volume label
  
    if (mousePressed && mouseX > 200 && mouseX < 440 + sfxSliderX && mouseY > 225 && mouseY < 265) {
      sfxSliderX = constrain(mouseX, 200, 440 + sfxSliderX);
    }
  
    // calculate the width of the blue rectangle based on the slider position
    float sfxSliderWidth = sfxSliderX - 200;
    sfxSliderWidth = constrain(sfxSliderWidth, 0, 240); // clamp the width of the blue rectangle
  
    fill(48, 173, 206); // Blue color
    rect(200, 225, sfxSliderWidth, 40, 20); // SFX volume slider
  
    fill(0); // Black color
    textAlign(CENTER, CENTER);
    text(int(map(sfxSliderWidth, 0, 240, 0, 100) + 0.5) + "%", 320, 240); // current SFX volume
    
    // Difficulty label
    fill(0); // black color
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Difficulty", 300, 325); // difficulty label
    
    // Difficulty buttons
    drawDifficultyButton(80, 365, "Normal");
    drawDifficultyButton(190, 365, "Medium");
    drawDifficultyButton(300, 365, "Hard");
    drawDifficultyButton(410, 365, "Insane");
    
    fill(0); // Black color
    textAlign(CENTER, CENTER);
    text(difficulty, width/2, 450); // display selected difficulty
    
    // gamemode label
    fill(0); // black color
    textSize(40);
    textAlign(CENTER, CENTER);
    text("Game Mode", 300, 525); // game mode label
    
    // Corruption label
    fill(0); // black color
    textSize(35);
    textAlign(CENTER, CENTER);
    text("Corruption", 200, 580);
  
     // Button
    if (isButtonOn) {
      fill(48, 173, 206); // blue color
    } else {
      fill(224, 148, 25); // orange color
    }
    rect(350, 560, 100, 50, 20); // button rectangle
  
    fill(255); // White color
    textSize(20);
    textAlign(CENTER, CENTER);
    if (isButtonOn) {
      text("ON", 400, 585); // button label when it's on
    } else {
      text("OFF", 400, 585); // button label when it's off
    }
    
    
    returnButton();
  }
  
  // go to instructions page
  if (MODE.equals("instructions")) {
    // these variables ensure the photo is the correct aspect ratio for our processing size(600,800)
    
    textSize(80);
    textAlign(CENTER, CENTER);
    text("Instructions", width/2, 50);
    
    int newWidth = 600;
    int newHeight = (int) ((float) newWidth * instructionsImage.height / instructionsImage.width);
    image(instructionsImage, 0, 200, newWidth, newHeight);

    returnButton();
  }

  if (MODE.equals("setup")) {
    
    textSize(80);
    textAlign(CENTER, CENTER);
    text("Setups", width/2, 50);
    
    textSize(40);
    
    // buttons
    fill(48, 173, 206); // blue color
    rect((width - 400) / 2, buttonY, 400, 50, 100);  // setup 1 button

    fill(48, 173, 206); // blue color
    rect((width - 400) / 2, buttonY + buttonSpacing, 400, 50, 100);  // setup 2 button

    fill(48, 173, 206); // blue color
    rect((width - 400) / 2, buttonY + 2 * buttonSpacing, 400, 50, 100);  // setup 3 button

    // button labels
    fill(0); // black text color
    text("setup 1", width / 2, buttonY + 25); // setup 1 label
    text("setup 2", width / 2, buttonY + buttonSpacing + 25); // setup 2 label
    text("setup 3", width / 2, buttonY + 2 * buttonSpacing + 25); // setup 3 label

    // check button press
    if (mousePressed && !buttonClicked) {
      // check if click falls within button
      if (mouseX > (width - 400) / 2 && mouseX < (width - 400) / 2 + 400 && mouseY > buttonY && mouseY < buttonY + 50) {
        //println("setup 1 clicked.");
        MODE = "play";
        board = new Board(1);
        keyboardInput = new Controller();
        moveCounter = 0;
        fallCd = 40;
        moveCd = 8;
        rotateCounter = 0;
        rotateCd = 20;
      } else if (mouseX > (width - 400) / 2 && mouseX < (width - 400) / 2 + 400 && mouseY > buttonY + buttonSpacing && mouseY < buttonY + buttonSpacing + 50) {
        //println("setup 2 clicked.");
        MODE = "play";
        board = new Board(2);
        keyboardInput = new Controller();
        moveCounter = 0;
        fallCd = 40;
        moveCd = 8;
        rotateCounter = 0;
        rotateCd = 20;
      } else if (mouseX > (width - 400) / 2 && mouseX < (width - 400) / 2 + 400 && mouseY > buttonY + 2 * buttonSpacing && mouseY < buttonY + 2 * buttonSpacing + 50) {
        //println("setup 3 clicked.");
        MODE = "play";
        board = new Board(3);
        keyboardInput = new Controller();
        moveCounter = 0;
        fallCd = 40;
        moveCd = 8;
        rotateCounter = 0;
        rotateCd = 20;
      }
      buttonClicked = true;
    } else if (!mousePressed) {
      buttonClicked = false;
    }

    returnButton();
  }
  

  if (MODE.equals("death")) {
    // make the current screen transparent
    background(255, 255, 255, 100);

    // draw the death screen on top of the transparent background
    fill(255, 0, 0); // red color
    rect(width/2 - 200, height/2 - 100, 400, 200, 10); // death screen rectangle

    fill(255); // white text color
    textSize(100);
    text("Game Over!", width/2, height/2 - 30); // death screen text
    returnButton();
  }
}

void drawDifficultyButton(float x, float y, String label) {
  if (difficulty.equals(label)) {
    fill(48, 173, 206); // blue color
  } else {
    fill(224, 148, 25); // orange color
  }
  
  rect(x, y, 100, 60, 20); // difficulty button
  
  fill(255); // White color
  textSize(30);
  textAlign(CENTER, CENTER);
  text(label, x + 50, y + 30); // difficulty button label
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
      // println("Return button clicked.");
      MODE = "menu"; // return to the menu page
    }
  } else {
    rect(width - 120, height - 80, 100, 50, 10); // return button in the bottom right corner
    fill(0); // black text color
    text("Return", width - 70, height - 55); // return button label

    // check if the return button is clicked
    if (mousePressed && mouseX > width - 120 && mouseX < width - 20 && mouseY > height - 80 && mouseY < height - 30) {
      // println("Return button clicked.");
      MODE = "menu"; // return to the menu page
    }
  }
}

void mousePressed() {
  if (MODE.equals("main")) {
    if (mouseX > 200 && mouseX < 400 && mouseY > 150 && mouseY < 190) {
      MODE = "settings";
    }
  } else if (MODE.equals("settings")) {
    if (mouseX > musicSliderX && mouseX < musicSliderX + 40 && mouseY > 150 && mouseY < 190) {
      isDraggingMusicSlider = true;
    } else if (mouseX > sfxSliderX && mouseX < sfxSliderX + 40 && mouseY > 250 && mouseY < 290) {
      isDraggingSFXSlider = true;
    } else if (mouseX > musicSliderX && mouseX < musicSliderX + 40 && mouseY > 150 && mouseY < 190) {
      isDraggingMusicSlider = true;
    } else if (mouseX > 200 && mouseX < 440 && mouseY > 150 && mouseY < 190) {
      musicSliderX = constrain(mouseX, 200, 440 + musicSliderX);
    } else if (mouseX > 200 && mouseX < 440 && mouseY > 250 && mouseY < 290) {
      sfxSliderX = constrain(mouseX, 200, 440 + sfxSliderX);
    } else if (mouseX > 80 && mouseX < 180 && mouseY > 365 && mouseY < 425) {
      difficulty = "Normal";
    } else if (mouseX > 190 && mouseX < 290 && mouseY > 365 && mouseY < 425) {
      difficulty = "Medium";
    } else if (mouseX > 300 && mouseX < 400 && mouseY > 365 && mouseY < 425) {
      difficulty = "Hard";
    } else if (mouseX > 410 && mouseX < 510 && mouseY > 365 && mouseY < 425) {
      difficulty = "Insane";
    } else if (mouseX > 350 && mouseX < 450 && mouseY > 560 && mouseY < 610) {
      isButtonOn = !isButtonOn; // toggle state of the button when clicked
    }
  }
}

void mouseReleased() {
  isDraggingMusicSlider = false;
  isDraggingSFXSlider = false;
}

void mouseDragged() {
  if (isDraggingMusicSlider) {
    musicSliderX = constrain(mouseX, 200, 400);
  } else if (isDraggingSFXSlider) {
    sfxSliderX = constrain(mouseX, 200, 400);
  }
}

void keyPressed() {
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
      text("PAUSED", width/2, 50);
    }
  }
}

void keyReleased() {
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
