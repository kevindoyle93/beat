class Board {
  Tile[][] tiles;
  Tile playerTile;
  Tile goalTile;
  int activeX = 0, activeY = 0;
  
  public Board(int gameWidth, int numTiles) {
    float tileSize = gameWidth * 0.8 / numTiles;
    float offset = gameWidth * 0.075;
    float gap = 0.5 * numTiles;
    this.tiles = new Tile[numTiles][numTiles];
    
    float y = offset;
    for (int i = 0; i < tiles.length; i++) {
      if (i > 0) {
        y += tileSize + gap;
      }
      
      float x = offset;
      for (int j = 0; j < tiles[0].length; j++) {
        boolean active = i == 0 && j == 0;
        if (j > 0) {
          x += tileSize + gap;
        }
        tiles[i][j] = new Tile(x, y, tileSize, tileSize, color(255), color(200), active);
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
  
  void movePlayer(Direction direction) {
    print("ayy");
    if (key == CODED) {
      if (keyCode == UP) {
        activeY = (activeY - 1) % tiles.length;
      } else if (keyCode == DOWN) {
        activeY = (activeY + 1) % tiles.length;
      } else if (keyCode == LEFT) {
        activeX = (activeX - 1) % tiles[0].length;
      } else if (keyCode == RIGHT) {
        activeX = (activeX + 1) % tiles[0].length;
      } else if (keyCode == ENTER) {
        // perform beat matching
      }
    }
    
    playerTile.active = false;
    playerTile = tiles[activeX][activeY];
    playerTile.active = true;
  }
}

public enum Direction {
  _UP, _DOWN, _LEFT, _RIGHT;
}
