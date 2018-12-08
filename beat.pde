void setup() {
  size(600, 600);
  background(200);
}

Board board = new Board(600, 8);

void draw() {
  board.draw();
}

void keyPressed() {
  // Tell the board to move player square
}
