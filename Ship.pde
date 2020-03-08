class Ship {
  private Position position;
  //booleans for if moved and if mandatory moved
  
  private final int baseSize;
  private float dir;
  private final Hull hull;
  private final boolean red;
  private ShipState shipState;
  
  public Ship(Position position, int length, int width, int baseSize, boolean red, float dir) {
    this.position = position;
    this.dir = dir; 
    this.hull = new Hull(length, width);
    this.baseSize = baseSize;
    this.red = red;
    this.shipState = ShipState.STANDARD;
  }
  
  public void draw() {
    if (position == null) {
      return;
    }
    strokeWeight(2);
    switch(this.shipState) {
      case STANDARD:
        stroke(100);
        break;
      case UNUSED:
        stroke(0, 200, 0);
        break;
      case CURRENT:
        stroke(255, 211, 0);
        break;
      case USED:
        stroke(200, 0, 0);
        break;
    }
    noFill();
    float screenBaseSize = this.baseSize * SCALE;
    ellipse(this.position.getScreenX(), this.position.getScreenY(), screenBaseSize, screenBaseSize);
    noStroke();
    if (red) {
      if (this == selectedShip) {
        fill(200, 50, 50);
      }
      else {
        fill(150, 0, 0);
      }
    }
    else {
      if (this == selectedShip) {
        fill(50, 50, 200);
      }
      else {
        fill(0, 0, 150);
      }
    }
    shape(this.hull.getShape(this.dir), this.position.getScreenX(), this.position.getScreenY());
  }
  
  public boolean within(int x, int y) {
    float xpos = this.position.getScreenX();
    float ypos = this.position.getScreenY();
    PVector distance = new PVector(x - xpos, ypos - y);
    float mag = distance.mag();
    if (mag <= this.baseSize * SCALE / 2) {
      return true;
    }
    distance.rotate(this.dir);
    return this.hull.within(distance);
  }
  
  public ShipState getState() {
    return this.shipState;
  }
  
  public void setState(ShipState shipState) {
    this.shipState = shipState;
  }
  
  public boolean getSide() {
    return this.red;
  }
}
