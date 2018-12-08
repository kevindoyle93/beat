class Board {
  Tile[][] tiles;
  Tile playerTile;
  Tile goalTile;
  int activeX, activeY;
  color targetColor;
  boolean playerOnTarget = false;
  boolean playerListening = false;
  BeatMatcher beatMatcher = new BeatMatcher(this);
  int playerScore = 0;
  
  public color[] tileColors = {
    color(78,255,0), 
    color(0,255,50), 
    color(0,205,255), 
    color(0,78,255), 
    color(0,255,177), 
    color(0,205,255),
    color(0,253,255),
    color(0,126,255),
    color(2,0,255),
    color(130,0,255),
    color(255,0,253),
    color(255,0,126)
  };
  
  public Board(int gameWidth, int boardStart, int numTiles) {
    float tileSize = gameWidth * 0.8 / numTiles;
    float offset = gameWidth * 0.075;
    float gap = 5;
    this.tiles = new Tile[numTiles][numTiles];
    
    chooseTargetColour();
    
    float y = boardStart + offset;
    for (int i = 0; i < tiles.length; i++) {
      if (i > 0) {
        y += tileSize + gap;
      }
      
      float x = offset;
      for (int j = 0; j < tiles[0].length; j++) {
        
        if (j > 0) {
          x += tileSize + gap;
        }
        tiles[i][j] = new Tile(x, y, tileSize, tileSize, color(255, 240, 230), false);
      }
    }
    
    assignPlayerLocation(); //<>// //<>//
  }
   //<>//
  void assignPlayerLocation() {
    activeX = int(random(8));
    activeY = int(random(8));
    
    playerTile = tiles[activeX][activeY];
    if (playerTile.fillColor == targetColor) {
      assignPlayerLocation();
    } else {
      playerTile.active = true;
    }
  }
  
  void chooseTargetColour() {
    targetColor = tileColors[int(random(tileColors.length))];
  }
  
  void draw() {
    for (int i = 0; i < tiles.length; i++) {
      for (int j = 0; j < tiles[0].length; j++) {
        tiles[i][j].draw();
      }
    }
  }
  
  void movePlayer(Direction direction) {
    if (!playerOnTarget && !playerListening) {
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
      
      if (playerTile.fillColor == targetColor) {
        println("Tile is correct!");
        //player is on the correct tile
        //player cannot move until end of round
        
        playerOnTarget = true;
      }
    }
  }
  
  void beatMatch() {
    if (playerOnTarget) {
      beatMatcher.onPlayerClick();
    }
  }
  
  void onBeatDifferenceCalculated(int difference) {
    playerOnTarget = false;
    
    // Calculate score
    println("Difference: " + difference);
    calculateScore(difference);
    
    chooseTargetColour();
  }
  
  void calculateScore(int difference) {
    if (difference < 1000) {
      int scoreThisRound = (1000 - difference) / 10;
      println("Score this round: " + scoreThisRound);
      playerScore += scoreThisRound;
    }
    println("Score: " + this.playerScore);
  }
}


public enum Direction {
  _UP, _DOWN, _LEFT, _RIGHT;
}
