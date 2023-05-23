public class board{
  int[][] grid; // grid of the board, -1 for nothing, 0+ for colors
  myPiece currentPiece, nextPiece, holdPiece; // the important pieces
  color[] colors; //converts number in grid to a color
  int linesCleared; //number of lines cleared
  
  public board(color[] c){
    grid = new int[22][10];
    colors = c;
    linesCleared = 0;
  }
  public void spawnPiece(){
    // spawns the nextPiece on the top middle of the grid
    
    // case 1: nextPiece is void
    
    // case 2: nextPiece is a real piece
  }
  
  public void removeLine(int row){
    //removes the line at row, assumes the row is full
  }
  
  public void addPiece(){
    //adds the currentPiece to the grid, makes nextPiece into currentPiece
  }
  
  public void printBoard(int x, int y){
    //prints the board, calls printPiece
    
    //printing the next
    
    //printing the hold
    
    //printing the grid
    
    //printing the currentPiece
  }
  
  
}
