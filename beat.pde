void setup() {
  size(600, 600);
  background(0);
}

Board board = new Board(600, 8);

void draw() {
  board.draw();
}
