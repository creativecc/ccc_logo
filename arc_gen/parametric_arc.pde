
class ParametricArc {

  float pos = 0;
  float angle = TWO_PI;
  float thickness = 1;
  color shade = color (#000000);
  float speed = 1.0;
  float radius = 10.0;
  
  void update (float delta) {
    pos += speed * delta; 
    if (pos > TWO_PI) {
      pos -= TWO_PI;
    }
  }
  
  void draw() {
    noFill();
    stroke (this.shade);
    strokeWeight (this.thickness);
    strokeCap (SQUARE);
    arc (0, 0, radius, radius, pos, pos + angle);
  }
}