class Tile {
  float x;
  float y;
  float w;
  float h;
  color fillColor;
  color strokeColor;
  boolean active;
  
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
  
  public Tile(float x, float y, float w, float h, color fillColor, color strokeColor, boolean active) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.fillColor = tileColors[int(random(0, tileColors.length))];
    this.strokeColor = strokeColor;
    this.active = active;
  }
  
  void draw() {
    fill(fillColor);
    if (active) {
      strokeWeight(4);
      stroke(color(0, 255, 0));
    } else {
      stroke(strokeColor);
    }
    rect(x, y, w, h); 
  }
}
