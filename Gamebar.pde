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
    text("BPM",10 , 20);
    
    
    // draw score
  }
  
}
