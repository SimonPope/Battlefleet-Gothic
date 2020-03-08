static int BOARD_LEFT;
static int BOARD_RIGHT;
static int BOARD_TOP;
static int BOARD_BOTTOM;
static float SCALE;
static int GAME_BOARD_WIDTH = 1800;
static int GAME_BOARD_HEIGHT = 1200;

ArrayList<Ship> allShips;
ArrayList<Ship> redShips;
ArrayList<Ship> blueShips;
GameState gameState;
boolean redTurn;
Ship selectedShip;

void setup() {
  fullScreen(1);
  int maxWidth = displayWidth;
  int maxHeight = displayHeight;
  float xScale = (float) maxWidth / GAME_BOARD_WIDTH;
  float yScale = (float) maxHeight / GAME_BOARD_HEIGHT;
  if (xScale < yScale) {
    SCALE = xScale;
    BOARD_LEFT = 0;
    BOARD_RIGHT = maxWidth;
    BOARD_TOP = 0;
    BOARD_BOTTOM = (int)(SCALE * GAME_BOARD_HEIGHT);
  }
  else {
    SCALE = yScale;
    BOARD_LEFT = 0;
    BOARD_RIGHT = (int)(SCALE * GAME_BOARD_WIDTH);
    BOARD_TOP = 0;
    BOARD_BOTTOM = maxHeight;
  }
  this.allShips = new ArrayList<Ship>();
  this.redShips = new ArrayList<Ship>();
  this.blueShips = new ArrayList<Ship>();
  
  addShip(new Ship(new Position(300, 300), 50, 20, 30, true, random(16) * PI / 16));
  addShip(new Ship(new Position(900, 400), 50, 20, 30, true, random(16) * PI / 16));
  addShip(new Ship(new Position(1200, 500), 50, 20, 30, true, random(16) * PI / 16));
  
  addShip(new Ship(new Position(400, 350), 50, 20, 30, false, random(16) * PI / 16));
  addShip(new Ship(new Position(1000, 450), 50, 20, 30, false, random(16) * PI / 16));
  addShip(new Ship(new Position(1100, 650), 50, 20, 30, false, random(16) * PI / 16));
  
  redTurn = true;
  startTurn();

}

void draw() {
  background(50);
  noStroke();
  fill(0);
  quad(BOARD_LEFT, BOARD_TOP, BOARD_RIGHT, BOARD_TOP, BOARD_RIGHT, BOARD_BOTTOM, BOARD_LEFT, BOARD_BOTTOM);
  for (Ship ship : allShips) {
    ship.draw();
  }
}

void mouseClicked() {
  switch(gameState) {
    case GENERIC_MOVE:
    case SHIP_SELECTED:
    case MOVE_AND_TURN:
      moveMouseClicked();
      break;
    default:
      break;
  }
}

void keyPressed() {
  switch(gameState) {
    case GENERIC_MOVE:
    case SHIP_SELECTED:
    case MOVE_AND_TURN:
      moveKeyPressed();
      break;
    default:
      break;
  }
}

void addShip(Ship ship) {
  allShips.add(ship);
  if (ship.getSide()) {
    redShips.add(ship);
  }
  else {
    blueShips.add(ship);
  }
}

ArrayList<Ship> getCurrentShips() {
  if (redTurn) {
    return redShips;
  }
  return blueShips;
}

ArrayList<Ship> getEnemyShips() {
  if (redTurn) {
    return blueShips;
  }
  return redShips;
}
