class Board {
  Tile[][] tiles;
  Tile playerTile;
  Tile goalTile;
  int activeX, activeY;
  
  public Board(int gameWidth, int numTiles) {
    float tileSize = gameWidth * 0.8 / numTiles;
    float offset = gameWidth * 0.075;
    float gap = 5;
    this.tiles = new Tile[numTiles][numTiles];
    
    assignPlayerLocation();
    
    float y = offset;
    for (int i = 0; i < tiles.length; i++) {
      if (i > 0) {
        y += tileSize + gap;
      }
      
      float x = offset;
      for (int j = 0; j < tiles[0].length; j++) {
        boolean active = i == activeX && j == activeY;
        if (j > 0) {
          x += tileSize + gap;
        }
        tiles[i][j] = new Tile(x, y, tileSize, tileSize, color(200), active);
      }
    }
    playerTile = tiles[0][0];
  }
  
  void assignPlayerLocation() {
    activeX = int(random(8));
    activeY = int(random(8));
  }
  
  void draw() {
    for (int i = 0; i < tiles.length; i++) {
      for (int j = 0; j < tiles[0].length; j++) {
        tiles[i][j].draw();
      }
    }
  }
  
  void movePlayer(Direction direction) {
    if (direction == Direction._UP) {
      activeX = (((activeX - 1) % tiles.length) + tiles.length) % tiles.length;
    } else if (direction == Direction._DOWN) {
      activeX = (activeX + 1) % tiles.length;
    } else if (direction == Direction._LEFT) {
      activeY = (((activeY - 1) % tiles.length) + tiles.length) % tiles.length;
    } else if (direction == Direction._RIGHT) {
      activeY = (activeY + 1) % tiles[0].length;
    }
    
    playerTile.active = false;
    playerTile = tiles[activeX][activeY]; //<>// //<>//
    playerTile.active = true;
  }
}

public enum Direction {
  _UP, _DOWN, _LEFT, _RIGHT;
}
