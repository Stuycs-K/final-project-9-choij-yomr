Board board;

void setup(){
  size(600, 800);
  board = new Board();
}

void draw() {
  background(192);
  board.printBoard(100,50);
}
