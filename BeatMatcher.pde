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
    playerHit = true;
    playerTime = millis();
    if (beatHit) {
      getDifference();
    }
  }
  
  void onBeatHit() {
    if (!beatHit) {
      print("beat has hit");
      beatHit = true;
      beatTime = millis();
    }
    if (playerHit) {
       getDifference();
    }
  }
  
  void getDifference() {
    board.onBeatDifferenceCalculated(abs(playerTime - beatTime));
    reset();
  }
  
  void reset() {
    this.playerHit = false;
    this.beatHit = false;
  }
}
