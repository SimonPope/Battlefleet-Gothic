class Position {
  private int gameX;
  private int gameY;
  
  public Position(int x, int y) {
    this.gameX = x;
    this.gameY = y;
  }
  
  public int getGameX() {
    return this.gameX;
  }
  
  public void setGameX(int x) {
    this.gameX = x;
  }
  
  public int getGameY() {
    return this.gameY;
  }
  
  public void setGameY(int y) {
    this.gameY = y;
  }
  
  public float getScreenX() {
    return this.gameX * SCALE + BOARD_LEFT;
  }
  
  public float getScreenY() {
    return this.gameY * SCALE + BOARD_TOP;
  }
  public PVector getScreenPosition(){
    return new PVector(getScreenX(), getScreenY());
  }
}
