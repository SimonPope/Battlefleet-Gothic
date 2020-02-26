class Ship {
  private Position position;
  //booleans for if moved and if mandatory moved
  
  int baseSize;
  float dir;
  final int length;
  final int width;
  Size size;
  
  
  public Ship(int length, int width) {
    position = null;
    this.length=length; 
    this.width=width;
    baseSize = (int)(25 * SCALE); //TODO
  }
  
  public Ship(Position position, int length ,int width, float dir) {
    this.position = position;
    this.length = length; 
    this.width=width;
    this.dir = dir; 
    size= new Size(length, width);
    baseSize = (int)(25 * SCALE); //TODO
  }
  
  public void draw() {
    if (position == null) {
      return;
    }
    strokeWeight(1);
    stroke(100);
    noFill();
    ellipse(this.position.getScreenX(), this.position.getScreenY(), baseSize, baseSize);
    stroke(204);
    shape(this.size.getShape(this.dir), this.position.getScreenX(), this.position.getScreenY());
  }
}
