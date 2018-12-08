class Gamebar {
  int barHeight;
  int bpm;
  int score;
  int gap;
  Board board;
  
  public Gamebar(int barHeight, int bpm, int score, Board board) {
    this.barHeight   = barHeight;
    this.bpm         = bpm;
    this.score       = score;
    this.board       = board;
    gap              = 10;
    
  }
  
  void draw() {
    //draw gamebar
    noStroke();
    fill(40, 40, 70);
    rect(0,0,width,barHeight);
    
    // draw target identifier
    stroke(255);
    strokeWeight(5);
    fill(board.targetColor);
    rect((width/2) - 65, gap, barHeight-(2*gap), barHeight-(2*gap));
    
    // draw bpm
    
    fill(255);
    textSize(32);
    text("BPM:", 40, 60);
    textSize(60);
    text(bpm, 30, 130);
    
    
    // draw score
    
    textSize(32);
    text("Score:", width-125, 60);
    textSize(60);
    text(score, width-170, 130);
  }
  
}
