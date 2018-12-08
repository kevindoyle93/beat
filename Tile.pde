class Tile {
  float x;
  float y;
  float w;
  float h;
  color fillColor;
  color strokeColor;
  boolean active;
  
  public Tile(float x, float y, float w, float h, color fillColor, color strokeColor, boolean active) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.fillColor = fillColor;
    this.strokeColor = strokeColor;
    this.active = active;
  }
  
  void draw() {
    fill(fillColor);
    stroke(strokeColor);
    rect(x, y, w, h); 
  }
}
