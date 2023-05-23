public class myPiece {
  int row, col; // defining row, column
  int[][][] versions; // rotations of each piece
  int currentVersion; // defining index of versions int[][][]
  color pieceColor; // the color of the piece 
  
  public void rotate(boolean direction) {
    // changes rotation of piece
    // if direction is true then it rotates right, if false then it rotates left
    // calls isValid(int[][] grid)
  }
  
  public boolean fallDownOne() {
    // shifts piece down by one square 
    // returns true when movement is done 
    // returns false if movement is invalid 

  }
  
  public void fallDownAll() {
    // moves piece all the way down 
  }
  
  
  public void move(int x) {
    // moves piece x squares to the right or left 
  }
  
  public void pieceDisplay(int x, int y, boolean flag) {
    // if true then on board 
    // if false then in hold or next display 
  }
  
  public boolean isValid(int[][][] grid) {
    // checks if position of piece is valid 
    // returns true if yes, false if no 
    // to be used in the rotate and fallDown methods 
    
    
  }
}
