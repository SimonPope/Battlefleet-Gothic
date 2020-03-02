class Hull {
  final Position[] positions ;

  public Hull(int gameLength, int gameWidth) {
    positions = new Position[]{  
      new Position(gameLength/2, 0), //bow
      new Position(gameLength/6, -gameWidth/2), //port bow
      new Position(-gameLength/2, -gameWidth/2), //port stern
      new Position(-gameLength/2, gameWidth/2),  //starboard stern
      new Position(gameLength/6, gameWidth/2) //starboard bow
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
  
  public boolean within(PVector distance) {
    float port = this.positions[1].getScreenY();
    float starboard = this.positions[3].getScreenY();
    float stern = this.positions[2].getScreenX();
    if (distance.y >= port && distance.y <= starboard && distance.x >= stern) {
      float midShip = this.positions[4].getScreenX();
      if (distance.x <= midShip) {
        return true;
      }
      float bow = this.positions[0].getScreenX();
      return abs(distance.y) <= (starboard * bow - starboard * distance.x) / (bow - midShip);
    }
    return false;
  }
}
