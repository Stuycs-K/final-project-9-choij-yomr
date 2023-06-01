static String MODE = "menu";

void setup() {
  size(600, 800);
    
  textAlign(CENTER, CENTER); // center text alignment
  textSize(40); // text size
  
 
}

void draw() {
  background(255); // white background

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

  
}
}
