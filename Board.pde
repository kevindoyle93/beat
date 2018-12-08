class Board {
  Tile[][] tiles;
  
  public Board(int gameWidth, int numTiles) {
    float tileSize = gameWidth * 0.85 / numTiles;
    float offset = gameWidth * 0.075;
    this.tiles = new Tile[numTiles][numTiles];
    
    for (int i = 0; i < numTiles; i++) {
      float y = i * tileSize + offset;
      for (int j = 0; j < numTiles; j++) {
        float x = j * tileSize + offset;
        tiles[i][j] = new Tile(x, y, tileSize, tileSize, color(255), color(0), false);
      }
    }
  }
  
  void draw() {
    for (int i = 0; i < tiles.length; i++) {
      for (int j = 0; j < tiles[0].length; j++) {
        tiles[i][j].draw();
      }
    }
  }
}
