import java.util.*;
public class Board {
  int[][] grid; // grid of the board, -1 for nothing, 0+ for colors
  MyPiece currentPiece, nextPiece, holdPiece; // the important pieces
  color[] colors; //converts number in grid to a color
  int linesCleared; //number of lines cleared
  int[][][][] allPieces; //an array of every possible piece
  String[] pieceTypes; // the possible shapes
  int[] rands; // to keep in track the pieces that have came up
  int[] defaultRands; // the default rands
  boolean swapped; // to make sure that the player can only swap once
  boolean end; // true if game is done, false if game is still going
  int setup; //setup number
  boolean pieceBottom; // boolean if piece is at the bottom
  int addPieceCd; //add piece cooldown
  boolean hardFall; // if the piece is hardFalling or not
  boolean rotated;


  public Board(int x) {
    grid = new int[22][10];
    for (int i = 0; i < grid.length; i++) {
      Arrays.fill(grid[i], -1);
    }
    setup = x;

    // different setups
    if (setup == 1) {
      for (int i = 21; i > 12; i--) {
        for (int j = 0; j < 9; j++) {
          grid[i][j] = 7;
        }
      }
    }

    if (setup == 2) {
      for (int i = 21; i > 19; i--) {
        for (int j = 0; j < 10; j++) {
          if (j != 6) {
            grid[i][j] = 7;
          }
        }
      }
      for (int i = 19; i > 16; i--) {
        for (int j = 0; j < 10; j++) {
          if (j != 5 && j != 6) {
            grid[i][j] = 7;
          }
        }
      }
      grid[17][6] = 7;
      for (int i = 16; i > 14; i--) {
        for (int j = 0; j < 10; j++) {
          if (j != 5 && j != 6 && j != 7) {
            grid[i][j] = 7;
          }
        }
      }
      grid[15][5] = 7;
      for (int i = 14; i > 12; i--) {
        for (int j = 8; j < 10; j++) {
          grid[i][j] = 7;
        }
      }
    }

    if (setup == 3) {
      for (int i = 21; i > 19; i--) {
        for (int j = 0; j < 10; j++) {
          if (j != 4) {
            grid[i][j] = 7;
          }
        }
      }
      for (int i = 19; i > 17; i--) {
        for (int j = 0; j < 10; j++) {
          if (j == 0 || j > 4) {
            grid[i][j] = 7;
          }
        }
      }
      for (int j = 5; j < 10; j++) {
        grid[17][j] = 7;
      }
      for (int j = 3; j < 10; j++) {
        grid[16][j] = 7;
        grid[15][j] = 7;
      }
    }
    end = false;
    swapped = false;
    pieceBottom = false;
    rotated = false;
    pieceTypes = new String[]{"square", "line", "blueL", "orangeL", "greenSnake", "redSnake", "tShape"};
    rands = new int[7];
    defaultRands = new int[7];
    colors = new color[]{ color(255, 255, 0), // yellow
      color(0, 255, 255), // cyan
      color(0, 0, 255), // blue
      color(255, 165, 0), // orange
      color(22, 100, 8), // green
      color(255, 0, 0), // red
      color(138, 43, 226), // purple
      color(119, 136, 153) // darker weird grey
    };
    addPieceCd = 15;
    linesCleared = 0;
    currentPiece = randomPiece();
    nextPiece = randomPiece();
  }


  public MyPiece getCurrentPiece() {
    return currentPiece;
  }

  public boolean getEnd() {
    return end;
  }


  public MyPiece randomPiece() {
    // randomPieces for setup
    if (setup == 1 || setup == 3) {
      return new MyPiece("line", 0);
    }
    if (setup == 2) {
      return new MyPiece("tShape", 0);
    }

    // returns a randomPiece, following the tetris rules
    String pieceType = "";

    //checking if all pieces were used, resetting rands if they were
    int count = 0;
    for (int i = 0; i < rands.length; i++) {
      if (rands[i] == -1) {
        count++;
      }
    }
    if (count == 7) {
      rands = new int[7];
    }
    //println(Arrays.toString(rands));
    while (true) {
      double randomNum = Math.random();
      for (int i = 1; i < 8; i++) {
        if (randomNum < i/7.0 && rands[i-1] == 0) {
          // if randomNum is within range, and rands tells us that the piece was not chosen before
          rands[i-1] = -1;
          pieceType = pieceTypes[i-1];
          return new MyPiece(pieceType, 0);
        }
      }
    }
  }

  public void swapHold() {
    // swaps the holdPiece and the currentPiece
    if (swapped) return; // if the player already swapped, then no swapping

    if (holdPiece == null) { // case 1: holdPiece is null
      holdPiece = currentPiece;
      holdPiece.resetPos(grid);
      currentPiece = nextPiece;
      nextPiece = spawnPiece();
      swapped = true;
    } else { // case 2: holdPiece is not null
      MyPiece temp = currentPiece;
      temp.resetPos(grid);
      currentPiece = holdPiece;
      holdPiece = temp;
      swapped = true;
    }
  }

  public void addPiece() {
    // adds the currentPiece to the grid, makes nextPiece into currentPiece
    int num = -1;
    if (currentPiece.getColor() == color(255, 255, 0)) {
      num = 0; // index for yellow
    } else if (currentPiece.getColor() == color(0, 255, 255)) {
      num = 1; // index for cyan
    } else if (currentPiece.getColor() == color(0, 0, 255)) {
      num = 2; // index for blue
    } else if (currentPiece.getColor() == color(255, 165, 0)) {
      num = 3; // index for orange
    } else if (currentPiece.getColor() == color(22, 100, 8)) {
      num = 4; // index for green
    } else if (currentPiece.getColor() == color(255, 0, 0)) {
      num = 5; // index for red
    } else if (currentPiece.getColor() == color(138, 43, 226)) {
      num = 6; // index for purple
    }
    int r = currentPiece.getR();
    int c = currentPiece.getC();
    int[][] squares = currentPiece.currentVersion();
    for (int i = 0; i < squares.length; i++) {
      int[] square = squares[i];
      int rowChange = square[0];
      int colChange = square[1];
      grid[r + rowChange][c + colChange] = num;
    }
    currentPiece = nextPiece;
    end = currentPiece.resetPos(grid);
    swapped = false;
    nextPiece = spawnPiece();
  }

  public MyPiece spawnPiece() {
    // returns where the nextPiece should spawn
    return randomPiece();
  }

  public void movePiece(int i) {
    if (currentPiece.isValid(grid, 0, i)) {
      currentPiece.setC(i);
    }
  }
  public boolean fallDownOne() {
    // shifts piece down by one square
    // returns true when movement is done
    // returns false if movement is invalid
    if (currentPiece.isValid(grid, 1, 0)) {
      currentPiece.setR(1);
      return true;
    }
    return false;
  }
  
  public boolean tryFallDownOne(){
    return currentPiece.isValid(grid, 1, 0);
  }

  public void fallDownAll() {
    while (fallDownOne());
    hardFall = true;
    addPieceCd = 0;
  }

  public void rotateLeft() {
    rotated =  currentPiece.rotatePiece(grid, false);
  }

  public void rotateRight() {
    rotated = currentPiece.rotatePiece(grid, true);
  }

  public void clearLine(int row) {
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
    grid[0] = new int[]{-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
  }

  public void switchLine(int row) {
    int[] temp = grid[row-1];
    grid[row] = temp;
  }

  public void printBoard(int x, int y) {
    // prints the board, calls printPiece
    textSize(17);

    // printing the nextPiece
    fill(255);
    rect(x + 340, y + 60, 120, 100);
    fill(0);
    text("next:", x + 400, y + 72);
    nextPiece.pieceDisplay(x + 375, y + 115, 0);

    // printing the holdPiece
    fill(255);
    rect(x + 340, y + 180, 120, 100);
    fill(0);
    text("hold:", x + 400, y + 192);
    if (holdPiece != null) {
      holdPiece.pieceDisplay(x + 375, y + 235, 0);
    }

    // printing the linesCleared
    fill(255);
    rect(x + 340, y + 300, 120, 50);
    fill(0);
    text("lines cleared:", x + 400, y + 312);
    text(linesCleared, x + 400, y + 333);

    // printing the grid
    for (int r = 2; r < grid.length; r++) {
      for (int c = 0; c < grid[r].length; c++) {
        stroke(0);
        if (grid[r][c] == -1) {
          fill(255);
          if (r < 2) {
            fill(128); //top 2 rows is buffer, this is just for testing
          }
        } else {
          fill(colors[grid[r][c]]);
        }
        square(x + c * 30, y + r * 30, 30);
      }
    }


    // printing the currentPiece

    if (!end) {
      currentPiece.ghostPieceDisplay(x, y, grid);
      currentPiece.pieceDisplayInGrid(x, y);
    }
  }

  public void resetFallCounter() {
    currentPiece.resetCounter();
  }

  public void fallTick(int cd) {
    // one tick of the falling down and board things (line clears)
    if (currentPiece.getCounter() % cd == 0) { // falling is not every tick
      fallDownOne(); // fall down one
    }
    
    
    pieceBottom = !tryFallDownOne();
    
    if (hardFall && !pieceBottom){ // if hardFalling and the piece isn't at the bottom
      fallDownAll(); // fallDown
    }
    
    if (rotated){
      rotated = false;
      addPieceCd = 40;
    }
      
    //print(addPieceCd);
    // when the piece reachs the bottom, a timer starts, piece only clicks once the timer ends
    // rotating the piece resets and increases the timer
    // hard falling still has a timer, but its decreased
    if (pieceBottom) { 
      if (addPieceCd == 0) {
        addPieceCd = 15;
        addPiece();
        hardFall = false;
        pieceBottom = false;
      } else {
        addPieceCd -=1;
      }
    }
    currentPiece.addCounter();
  }
}
