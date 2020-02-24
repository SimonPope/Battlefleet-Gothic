class Ship {
  private Position position;
  //booleans for if moved and if mandatory moved
  
  int baseSize;
  
  public Ship() {
    position = null;
    baseSize = (int)(25 * SCALE); //TODO
  }
  
  public Ship(Position position) {
    this.position = position;
    baseSize = (int)(25 * SCALE); //TODO
  }
  
  public void draw() {
    if (position == null) {
      return;
    }
    strokeWeight(1);
    stroke(100);
    noFill();
    ellipse(this.position.getGameX(), this.position.getGameY(), baseSize, baseSize);
  }
}
