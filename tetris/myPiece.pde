public class MyPiece {
  int row, col; // defining row, column
  int[][][] versions; // rotations of each piece
  int currentVersion; // defining index of versions int[][][]
  int fallCounter; // the counter for the passive falling of the piece
  color pieceColor; // the color of the piece


  public MyPiece(String piece, int changeOfR) {
    currentVersion = 0;
    fallCounter = 1;
  
    // assigns the version var and color var depending on the string
    // also assigns the starting row and col depending on the string
    if (piece.equals("square")) { //square shape
      pieceColor = color(255,255,0); //yellow
      int[][] temp1 = new int[][] {{0, 0}, {-1, 0}, {-1, 1}, {0, 1}};
      int[][] temp2 = new int[][] {{0, 0}, {-1, 0}, {-1, 1}, {0, 1}};
      int[][] temp3 = new int[][] {{0, 0}, {-1, 0}, {-1, 1}, {0, 1}};
      int[][] temp4 = new int[][] {{0, 0}, {-1, 0}, {-1, 1}, {0, 1}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else if (piece.equals("line")){ // line shape
      pieceColor = color(0,255,255); // cyan
      int[][] temp1 = new int[][] {{0, 0}, {0, -1}, {0, 1}, {0, 2}};
      int[][] temp2 = new int[][] {{0, 1}, {-1, 1}, {1, 1}, {2, 1}};
      int[][] temp3 = new int[][] {{-1, 0}, {-1, -1}, {-1, 1}, {-1, 2}};
      int[][] temp4 = new int[][] {{0, 0}, {-1, 0}, {1, 0}, {2, 0}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 2 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else if (piece.equals("blueL")){ // 
      pieceColor = color(0,0,255); // blue
      int[][] temp1 = new int[][] {{0, 0}, {0, 1}, {0, -1}, {-1, -1}};
      int[][] temp2 = new int[][] {{0, 0}, {-1, 0}, {1, 0}, {-1, 1}};
      int[][] temp3 = new int[][] {{0, 0}, {0, 1}, {0, -1}, {1, 1}};
      int[][] temp4 = new int[][] {{0, 0}, {-1, 0}, {1, 0}, {1, -1}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else if (piece.equals("orangeL")){ // 
      pieceColor =  color(255, 165, 0); // orange
      int[][] temp1 = new int[][] {{0, 0}, {0, 1}, {0, -1}, {-1, 1}};
      int[][] temp2 = new int[][] {{0, 0}, {-1, 0}, {1, 0}, {1, 1}};
      int[][] temp3 = new int[][] {{0, 0}, {0, 1}, {0, -1}, {1, -1}};
      int[][] temp4 = new int[][] {{0, 0}, {-1, 0}, {1, 0}, {-1, -1}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else if (piece.equals("greenSnake")){ // 
      pieceColor =  color(22,100,8); // green
      int[][] temp1 = new int[][] {{0, 0}, {0, -1}, {-1, 0}, {-1, 1}};
      int[][] temp2 = new int[][] {{0, 0}, {0, 1}, {-1, 0}, {1, 1}};
      int[][] temp3 = new int[][] {{0, 0}, {0, 1}, {1, 0}, {1, -1}};
      int[][] temp4 = new int[][] {{0, 0}, {0, -1}, {-1, -1}, {1, 0}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else if (piece.equals("redSnake")){ // 
      pieceColor =  color(255, 0, 0); // green
      int[][] temp1 = new int[][] {{0, 0}, {-1, 0}, {0, 1}, {-1, -1}};
      int[][] temp2 = new int[][] {{0, 0}, {0, 1}, {1, 0}, {-1, 1}};
      int[][] temp3 = new int[][] {{0, 0}, {0, -1}, {1, 0}, {1, 1}};
      int[][] temp4 = new int[][] {{0, 0}, {0, -1}, {1, -1}, {-1, 0}};
      versions = new int[][][]{temp1, temp2, temp3, temp4};
      row = 3 - changeOfR; //starts at the top row
      col = 4; // middle of the board
    } else { // WHEN STRING IS tShape, java forces me to do else here
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
      // NEED TO ADD WALL KICKS HERE LATER MAYBE PROBABLY I SHOULD DO THIS
      // https://tetris.wiki/Super_Rotation_System
    }
    
  }




  public void pieceDisplayInGrid(int x, int y) {
    // displays the piece, x and y is where the grid is, use
    // instance vars row and col to print where in the grid

    for (int i = 0; i < versions[currentVersion].length; i++) {
      fill(pieceColor);
      // getting the row and col coord from every square of the currentVersion
      int changeR = versions[currentVersion][i][0];
      int changeC = versions[currentVersion][i][1];
      square(x + (col + changeC) * 30, y + (row + changeR) * 30, 30);
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
      square(x + changeR * 30, y + changeC * 30, 30);
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
