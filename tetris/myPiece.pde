public class myPiece {
  int row, col; // defining row, column
  int[][][] versions; // rotations of each piece
  int currentVersion; // defining index of versions int[][][]
  int fallCounter; // the counter for the passive falling of the piece
  color pieceColor; // the color of the piece 
  
  
  public myPiece(String piece){
    whichPiece(piece);
    currentVersion = 1;
    fallCounter = 0;
  }
  
  public void whichPiece(String piece){
    // assigns the version var and color var depending on the string
    // also assigns the starting row and col depending on the string
  }
  
  public int getFallCounter(){
    return fallCounter;
  }
  
  public int getR(){
    return row;
  }
  
  public int getC(){
    return col;
  }
  
  public color getColor(){
    return pieceColor;
  }
  
  
  public void rotatePiece(int[][] grid, boolean direction) {
    // changes rotation of piece
    // if direction is true then it rotates right, if false then it rotates left
    // calls isValid(int[][] grid)
    int newVersion = currentVersion;
    // changes the version to what it will rotate to
    if (direction){
      newVersion+=1;
    } else {
      newVersion-=1;
    }
    if (newVersion == 4){
      newVersion = 0;
    } else if (newVersion == -1){
      newVersion = 3;
    }
    // checks if the rotation is vaild
    if (isValid(grid, newVersion)){
      currentVersion = newVersion;
    }
  }
  
  
  
  public boolean fallDownOne(int[][] grid) {
    // shifts piece down by one square 
    // returns true when movement is done 
    // returns false if movement is invalid 
    if (isValid(grid, 1, 0)){
      row+=1;
      return true;
    }
    return false;
  }
  
  public void fallDownAll(int[][] grid) {
    // just calls fallDownOne until the block cannot fall down
    while(fallDownOne(grid)){}
  }
  
  
  public void move(int[][] grid, int x) {
    // moves piece x squares to the right or left 
    
  }
  
  public void pieceDisplay(int x, int y) {
    // displays the piece, x and y is where the grid is, use 
    // instance vars row and col to print where in the grid
  }
  
  public void pieceDisplay(int x, int y, int v) {
    // displays the piece at x and y directly, uses version v
    // used for displaying the piece in the hold and next piece squares
   
  }
  
  public boolean isValid(int[][] grid, int version) {
   // returns true if the position of the currentPiece is valid
   // position uses the verison argument, not the currentVersion
    return true;
  }
  
  public boolean isValid(int[][] grid, int changeR, int changeC) {
   // returns true if the position of the currentPiece is valid
   // position changed by changeR and changeC
    return true;
  }
  
  public boolean isValid(int[][] grid, int version, int changeR, int changeC) {
   // returns true if the position of the currentPiece is valid
   // position uses the verison argument, not the currentVersion
   // position changed by changeR and changeC
   
    return true;
  }
}
