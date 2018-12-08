class Gamebar {
  int barHeight;
  color targetColor;
  int bpm;
  int score;
  int gap;
  
  public Gamebar(int barHeight, color targetColor, int bpm, int score) {
    this.barHeight   = barHeight;
    this.targetColor = targetColor;
    this.bpm         = bpm;
    this.score       = score;
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
    fill(targetColor);
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
