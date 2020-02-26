class Size {
  final Position[] positions ;

  public Size(int gameLength, int gameWidth) {
    positions = new Position[]{  
      new Position(gameLength/2, 0), 
      new Position(gameLength/6, -gameWidth/2), 
      new Position(-gameLength/2, -gameWidth/2), 
      new Position(-gameLength/2, gameWidth/2), 
      new Position(gameLength/6, gameWidth/2)
    };
  }
  public PShape getShape(float dir) {
    PShape shape = createShape();
    shape.beginShape();
    for (Position position : positions) {
      PVector vector = position.getScreenPosition().rotate(dir);
      shape.vertex(vector.x, vector.y);
    }
    shape.endShape(CLOSE);
    return shape;
  }
}
