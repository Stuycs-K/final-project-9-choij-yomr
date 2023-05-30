import java.util.*;
public class Board{
  int[][] grid; // grid of the board, -1 for nothing, 0+ for colors
  MyPiece currentPiece, nextPiece, holdPiece; // the important pieces
  color[] colors; //converts number in grid to a color
  int linesCleared; //number of lines cleared
  int[][][][] allPieces; //an array of every possible piece
  boolean swappedHold; // to make sure you can only swap once per piece
  int[] rands; // to keep in track the pieces that have came up
 
  public Board(){
    grid = new int[22][10];
    for (int i = 0; i < grid.length; i++){
      Arrays.fill(grid[i], -1);
    }
    colors = new color[]{ color(255,255,0), // yellow
                          
                        };
                        
    linesCleared = 0;
    currentPiece = randomPiece(0);
    nextPiece = randomPiece(0);
  }
  public MyPiece randomPiece(int changeOfR){
    // returns a randomPiece, following the tetris rules
    return new MyPiece("square", changeOfR);
  }
  
  public void swapHold(){
    // swaps the holdPiece and the currentPiece
    
    // I think easiest way to do this is make holdPiece a new instance of myPiece
    // (same shape as currentPiece ofc)in order to reset the position of the piece 
    
    // case 1: holdPiece is null
    
    // case 2: holdPiece is not null
  }
  
  public void addPiece(){
    // adds the currentPiece to the grid, makes nextPiece into currentPiece
    int num = -1;
    if (currentPiece.getColor() == color(255,255,0)){
      num = 0; // index for yellow
    }
    int r = currentPiece.getR();
    int c = currentPiece.getC();
    int[][] squares = currentPiece.currentVersion();
    for (int i = 0; i < squares.length; i++){
      int[] square = squares[i];
      int rowChange = square[0];
      int colChange = square[1];
      grid[r + rowChange][c + colChange] = num;
    }
    currentPiece = nextPiece;
    nextPiece = randomPiece(0);
  }
  
  public MyPiece spawnPiece(){
    // returns where the nextPiece should spawn 
    MyPiece temp = randomPiece(0);
    if (!temp.isValid(grid)){ // check if the piece can be spawned
      temp.setR(-1); // if not, tries to spawn the piece one row up
    }
    if (!temp.isValid(grid)){ // check if the piece can be spawned
      temp.setR(-1); // if not, tries to spawn the piece two row up
    }
    if (!temp.isValid(grid)){
      endGame();
    }
    return temp;
    
  }
  
  public void movePiece(int i){
    if (currentPiece.isValid(grid, 0, i)){
      currentPiece.setC(i);
    }
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
  
  
  public void printBoard(int x, int y){
    // prints the board, calls printPiece
    
    // printing the nextPiece
    
    // printing the holdPiece
    
    // printing the grid
    for (int r = 0; r < grid.length; r++){
      for (int c = 0; c < grid[r].length; c++){
        stroke(0);
        if (grid[r][c] == -1) {
          fill(255);
          if (r < 2){
            fill(128); //top 2 rows is buffer, this is just for testing
          }
        } else {
          fill(colors[grid[r][c]]);
        }
        square(x + c * 30, y + r * 30, 30);
      }
    }
    
    
    // printing the currentPiece
    currentPiece.pieceDisplayInGrid(x, y);
  }
  
  public void endGame(){
  }
  
  
}
