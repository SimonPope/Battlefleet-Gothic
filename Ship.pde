class Ship {
  private Position position;
  //booleans for if moved and if mandatory moved
  
  private final int baseSize;
  private float dir;
  private final int length;
  private final int width;
  private final Hull hull;
  
  
  public Ship(int length, int width, int baseSize) {
    position = null;
    this.length = length; 
    this.width = width;
    hull = new Hull(length, width);
    this.baseSize = baseSize;
  }
  
  public Ship(Position position, int length, int width, int baseSize, float dir) {
    this.position = position;
    this.length = length; 
    this.width=width;
    this.dir = dir; 
    hull= new Hull(length, width);
    this.baseSize = baseSize;
  }
  
  public void draw() {
    if (position == null) {
      return;
    }
    strokeWeight(1);
    stroke(100);
    noFill();
    float screenBaseSize = this.baseSize * SCALE;
    ellipse(this.position.getScreenX(), this.position.getScreenY(), screenBaseSize, screenBaseSize);
    noStroke();
    fill(150, 0, 0);
    shape(this.hull.getShape(this.dir), this.position.getScreenX(), this.position.getScreenY());
    stroke(255, 100);
    float xpos = this.position.getScreenX();
    float ypos = this.position.getScreenY();
    int left = (int)xpos - 500;
    int right = (int)xpos + 500;
    int top = (int)ypos - 500;
    int bottom = (int)ypos + 500;
    for (int x = left; x < right; x++) {
      for (int y = top; y < bottom; y++) {
        PVector distance = new PVector(xpos - x, ypos - y);
        distance.rotate(this.dir);
        if (this.hull.within(distance)) {
          point(x, y);
        }
      }
    }
  }
  
  public boolean wasClicked() {
    float x = this.position.getScreenX();
    float y = this.position.getScreenY();
    PVector distance = new PVector(x - mouseX, y - mouseY);
    float mag = distance.mag();
    if (mag <= this.baseSize * SCALE / 2) {
      return true;
    }
    distance.rotate(this.dir);
    return this.hull.within(distance);
  }
}
