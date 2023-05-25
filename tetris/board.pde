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
  
  public boolean clearline(int r){
    // tries to clear the line at row r
    // returns true if the line is cleared, false if not
  }
  public void clearLines(){
    //goes through the whole grid, and tries to clear every line
 
  }
  
  
  
  public void removeLine(int row){
    //removes the line at row, assumes the row is full
  }
  
  public void addPiece(){
    //adds the currentPiece to the grid, makes nextPiece into currentPiece
  }
  
  public void printBoard(int x, int y){
    //prints the board, calls printPiece
    
    //printing the nextPiece
    
    //printing the holdPiece
    
    //printing the grid
    
    //printing the currentPiece
  }
  
  
}
