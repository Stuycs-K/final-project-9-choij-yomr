public class board{
  int[][] grid; // grid of the board, -1 for nothing, 0+ for colors
  myPiece currentPiece, nextPiece, holdPiece; // the important pieces
  color[] colors; //converts number in grid to a color
  int linesCleared; //number of lines cleared
  int[][][][] allPieces; //an array of every possible piece
  boolean swappedHold; // to make sure you can only swap once per piece
  int[] rands; // to keep in track the pieces that have came up
  
  public board(color[] c){
    grid = new int[22][10];
    colors = c;
    linesCleared = 0;
  }
  public myPiece randomPiece(){
    // returns a randomPiece, following the tetris rules
    
  }
  
  public void swapHold(){
    // swaps the holdPiece and the currentPiece
    
    // I think easiest way to do this is make holdPiece a new instance of myPiece
    // (same shape as currentPiece ofc)in order to reset the position of the piece 
    
    // case 1: holdPiece is null
    
    // case 2: holdPiece is not null
  }
  
  public void clearline(int row){
    // tries to clear the line at int row
    // returns true if the line is cleared, false if not
    int counter = 0;
    for (int i = 0; i < grid[row].length; i++) {
      if (grid[row][i] == -1) {
        counter += 1; 
      } 
    }
    if (counter == 0) {
      linesCleared += 1;
      for (int i = row; i > 0; i--) {
        switchLine(i);
      }
    }
    grid[0] = new int[]{-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};
  }

  public void switchLine(int row) {
    int[] temp = grid[row-1];
    grid[row] = temp;
  }
  
  public void addPiece(){
    // adds the currentPiece to the grid, makes nextPiece into currentPiece
  }
  
  public void printBoard(int x, int y){
    // prints the board, calls printPiece
    
    // printing the nextPiece
    
    // printing the holdPiece
    
    // printing the grid
    
    // printing the currentPiece
  }
  
  
}
