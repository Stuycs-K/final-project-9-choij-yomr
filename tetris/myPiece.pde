public class MyPiece {
  int row, col; // defining row, column
  int[][][] versions; // rotations of each piece
  int currentVersion; // defining index of versions int[][][]
  int fallCounter; // the counter for the passive falling of the piece
  color pieceColor; // the color of the piece
  String pieceName; // name of the piece

  public MyPiece(String piece, int changeOfR) {
    currentVersion = 0;
    fallCounter = 1;
    pieceName = piece;
    // assigns the version var and color var depending on the string
    // also assigns the starting row and col depending on the string
    if (pieceName.equals("square")) { //square shape
      pieceColor = color(255,255,0); //yellow
      int[][] temp1 = new int[][] {{0, 0}, {-1, 0}, {-1, 1}, {0, 1}};
      int[][] temp2 = new int[][] {{0, 0}, {-1, 0}, {-1, 1}, {0, 1}};
      int[][] temp3 = new int[][] {{0, 0}, {-1, 0}, {-1, 1}, {0, 1}};
      int[][] temp4 = new int[][] {{0, 0}, {-1, 0}, {-1, 1}, {0, 1}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else if (pieceName.equals("line")){ // line shape
      pieceColor = color(0,255,255); // cyan
      int[][] temp1 = new int[][] {{0, 0}, {0, -1}, {0, 1}, {0, 2}};
      int[][] temp2 = new int[][] {{0, 1}, {-1, 1}, {1, 1}, {2, 1}};
      int[][] temp3 = new int[][] {{-1, 0}, {-1, -1}, {-1, 1}, {-1, 2}};
      int[][] temp4 = new int[][] {{0, 0}, {-1, 0}, {1, 0}, {2, 0}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 2 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else if (pieceName.equals("blueL")){ // 
      pieceColor = color(0,0,255); // blue
      int[][] temp1 = new int[][] {{0, 0}, {0, 1}, {0, -1}, {-1, -1}};
      int[][] temp2 = new int[][] {{0, 0}, {-1, 0}, {1, 0}, {-1, 1}};
      int[][] temp3 = new int[][] {{0, 0}, {0, 1}, {0, -1}, {1, 1}};
      int[][] temp4 = new int[][] {{0, 0}, {-1, 0}, {1, 0}, {1, -1}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else if (pieceName.equals("orangeL")){ // 
      pieceColor =  color(255, 165, 0); // orange
      int[][] temp1 = new int[][] {{0, 0}, {0, 1}, {0, -1}, {-1, 1}};
      int[][] temp2 = new int[][] {{0, 0}, {-1, 0}, {1, 0}, {1, 1}};
      int[][] temp3 = new int[][] {{0, 0}, {0, 1}, {0, -1}, {1, -1}};
      int[][] temp4 = new int[][] {{0, 0}, {-1, 0}, {1, 0}, {-1, -1}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else if (pieceName.equals("greenSnake")){ // 
      pieceColor =  color(22,100,8); // green
      int[][] temp1 = new int[][] {{0, 0}, {0, -1}, {-1, 0}, {-1, 1}};
      int[][] temp2 = new int[][] {{0, 0}, {0, 1}, {-1, 0}, {1, 1}};
      int[][] temp3 = new int[][] {{0, 0}, {0, 1}, {1, 0}, {1, -1}};
      int[][] temp4 = new int[][] {{0, 0}, {0, -1}, {-1, -1}, {1, 0}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else if (pieceName.equals("redSnake")){ // 
      pieceColor =  color(255, 0, 0); // green
      int[][] temp1 = new int[][] {{0, 0}, {-1, 0}, {0, 1}, {-1, -1}};
      int[][] temp2 = new int[][] {{0, 0}, {0, 1}, {1, 0}, {-1, 1}};
      int[][] temp3 = new int[][] {{0, 0}, {0, -1}, {1, 0}, {1, 1}};
      int[][] temp4 = new int[][] {{0, 0}, {0, -1}, {1, -1}, {-1, 0}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else { // when pieceName is tShape, java forces me to do else here so no else if
      pieceColor =  color(138, 43, 226); // purple
      int[][] temp1 = new int[][] {{0, 0}, {0, -1}, {-1, 0}, {0, 1}};
      int[][] temp2 = new int[][] {{0, 0}, {0, 1}, {-1, 0}, {1, 0}};
      int[][] temp3 = new int[][] {{0, 0}, {0, 1}, {1, 0}, {0, -1}};
      int[][] temp4 = new int[][] {{0, 0}, {0, -1}, {-1, 0}, {1, 0}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; // starts at the top row
      col = 4; // middle of the board
    }
   
  }
  
  

  public int getCounter() {
    return fallCounter;
  }

  public int getR() {
    return row;
  }

  public int getC() {
    return col;
  }

  public color getColor() {
    return pieceColor;
  }
  
  public void setR(int i){
    row+=i;
  }
  
  public void setC(int i){
    col+=i;
  }  
  
  public void addCounter(){
    fallCounter++;
  }
  
  public void resetCounter(){
    fallCounter = 1;
  }
  
  public int[][] currentVersion(){
    return versions[currentVersion];
  }
  
  public boolean resetPos(int[][] grid){
    // resets the piece to the orginal state
    currentVersion = 0;
    if (pieceName.equals("line")){
      row = 2;
      col = 4;
    } else {
      row = 3;
      col = 4;
    }
    if (!isValid(grid)) { // check if the piece can be spawned
      setR(-1); // if not, tries to spawn the piece one row up
    }
    if (!isValid(grid)) {
      return true;
    }
    return false;
  }
  

  public void rotatePiece(int[][] grid, boolean direction) {
    // changes rotation of piece
    // if direction is true then it rotates right, if false then it rotates left
    // calls isValid(int[][] grid)
    int newVersion = currentVersion;
    // changes the version to what it will rotate to
    if (direction) {
      newVersion+=1;
    } else {
      newVersion-=1;
    }
    if (newVersion == 4) {
      newVersion = 0;
    } else if (newVersion == -1) {
      newVersion = 3;
    }
    // checks if the rotation is vaild
    if (isValid(grid, newVersion)) {
      currentVersion = newVersion;
    } else {
      //WALL KICKS
      int[][] wallKicks = getWallKicks(currentVersion, newVersion);
      for (int i = 0; i < wallKicks.length; i++){
        int changeC = wallKicks[i][0];
        int changeR = wallKicks[i][1];
        if (isValid(grid, newVersion, changeR, changeC)){
          currentVersion = newVersion;
          row += changeR;
          col += changeC;
          println("row: " + row);
          println("col: " + col);
          break;
        }
      }
    }
  }
  
  // getting the wall kicks
  // https://tetris.wiki/Super_Rotation_System
  // +1 is right, -1 is left 0,R,2,L
  //                         0,1,2,3
  // (x,-y) for translation
  public int[][] getWallKicks(int oldVersion, int newVersion){
    if (pieceName.equals("square")) return null; // no wall kicks for squares
    
    if (pieceName.equals("line")){ // wall kicks are different for lines bc they hate me
      if (oldVersion == 0){
        if (newVersion == 1){
          return new int[][] {{-2, 0}, {1, 0}, {-2, 1}, {1, -2}};
        } else if (newVersion == 3){
          return new int[][] {{-1, 0}, {2, 0}, {-1, -2}, {2, 1}};
        }
      } else if (oldVersion == 1){
        if (newVersion == 0){
          return new int[][] {{2, 0}, {-1, 0}, {2, -1}, {-1, 2}};
        } else if (newVersion == 2){
          return new int[][] {{-1, 0}, {2, 0}, {-1, -2}, {2, 1}};
        }
      } else if (oldVersion == 2){
        if (newVersion == 1){
          return new int[][] {{-1, 0}, {-2, 0}, {1, 2}, {-2, -1}};
        } else if (newVersion == 3){
          return new int[][] {{2, 0}, {-1, 0}, {2, -1}, {-1, 2}};
        }
      } else if (oldVersion == 3){
        if (newVersion == 2){
          return new int[][] {{-2, 0}, {1, 0}, {-2, 1}, {1, -2}};
        } else if (newVersion == 0){
          return new int[][] {{1, 0}, {2, -0}, {1, 2}, {-2, 1}};
        }
      }
    } else { // wall kicks for every other shape
      if (oldVersion == 0){
        if (newVersion == 1){
          return new int[][] {{-1, 0}, {-1, -1}, {0, 2}, {-1, 2}};
        } else if (newVersion == 3){
          return new int[][] {{1, 0}, {1, -1}, {0, 2}, {-1, 2}};
        }
      } else if (oldVersion == 1){
        if (newVersion == 0){
          return new int[][] {{1, 0}, {1, 1}, {0, -2}, {1, -2}};
        } else if (newVersion == 2){
          return new int[][] {{1, 0}, {1, 1}, {0, -2}, {1, -2}};
        }
      } else if (oldVersion == 2){
        if (newVersion == 1){
          return new int[][] {{-1, 0}, {-1, -1}, {0, 2}, {-1, 2}};
        } else if (newVersion == 3){
          return new int[][] {{1, 0}, {1, -1}, {0, 2}, {1, 2}};
        }
      } else if (oldVersion == 3){
        if (newVersion == 2){
          return new int[][] {{-1, 0}, {-1, 1}, {0, -2}, {-1, -2}};
        } else if (newVersion == 0){
          return new int[][] {{1, 0}, {-1, 1}, {0, -2}, {-1, 2}};
        }
      }
    }
    
    return null;
  }

  public void pieceDisplayInGrid(int x, int y) {
    // displays the piece, x and y is where the grid is, use
    // instance vars row and col to print where in the grid

    for (int i = 0; i < versions[currentVersion].length; i++) {
      fill(pieceColor);
      // getting the row and col coord from every square of the currentVersion
      int changeR = versions[currentVersion][i][0];
      int changeC = versions[currentVersion][i][1];
      if (row + changeR > 1){
        square(x + (col + changeC) * 30, y + (row + changeR) * 30, 30);
      }
    }
  }

  public void pieceDisplay(int x, int y, int v) {
    // displays the piece at x and y directly, uses version v
    // used for displaying the piece in the hold and next piece squares

    for (int i = 0; i < versions[v].length; i++) {
      fill(pieceColor);
      // getting the row and col coord from every square of the currentVersion
      int changeR = versions[v][i][0];
      int changeC = versions[v][i][1];
      square(x + changeC * 25, y + changeR * 25, 25);
    }
  }
  
  public boolean isValid(int[][] grid) {
    // returns true if the position of the currentPiece is valid
    // position uses the verison argument, not the currentVersion
    return isValid(grid, currentVersion, 0 ,0);
  }
  
  public boolean isValid(int[][] grid, int version) {
    // returns true if the position of the currentPiece is valid
    // position uses the verison argument, not the currentVersion
    return isValid(grid, version, 0 ,0);
  }

  public boolean isValid(int[][] grid, int changeR, int changeC) {
    // returns true if the position of the currentPiece is valid
    // position changed by changeR and changeC
    return isValid(grid, currentVersion, changeR, changeC);
  }

  public boolean isValid(int[][] grid, int version, int changeR, int changeC) {
    // returns true if the position of the currentPiece is valid
    // position uses the verison argument, not the currentVersion
    // position changed by changeR and changeC
    for (int i = 0; i < versions[version].length; i++) {
      // getting the row and col of the theoretical square
      int tempRow = versions[version][i][0] + changeR + row; 
      int tempCol = versions[version][i][1] + changeC + col;
      // checking if the theoretical square is out of bounds or in a filled up square
      if (tempRow < 0 ||
          tempRow >= grid.length ||
          tempCol < 0 ||
          tempCol >= grid[0].length ||
          grid[tempRow][tempCol] != -1) {
        return false;
      }
    }
    return true;
  }
}
