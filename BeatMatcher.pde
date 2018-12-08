class BeatMatcher {
  Board board;
  
  int playerTime;
  int beatTime;
  
  boolean playerHit;
  boolean beatHit;
  
  BeatMatcher(Board board) {
    this.board = board;
    reset();
  }
  
  void onPlayerClick() {
    if (!playerHit) {
      println("player has hit");
      playerHit = true;
      playerTime = millis();
    }
    if (beatHit) {
      getDifference();
    }
  }
  
  void onBeatHit() {
    if (!beatHit) {
      println("beat has hit");
      beatHit = true;
      beatTime = millis();
    }
    
    if (playerHit) {
       getDifference();
    }
  }
  
  void getDifference() {
    println("getDifference()");
    println("player time: " + playerTime);
    println("beat time: " + beatTime);
    board.onBeatDifferenceCalculated(abs(playerTime - beatTime));
    reset();
  }
  
  void reset() {
    this.playerHit = false;
    this.beatHit = false;
  }
}
