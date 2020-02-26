static int BOARD_LEFT;
static int BOARD_RIGHT;
static int BOARD_TOP;
static int BOARD_BOTTOM;
static float SCALE;
static int GAME_BOARD_WIDTH = 1800;
static int GAME_BOARD_HEIGHT = 1200;

Ship frontFellOff;

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
 frontFellOff = new Ship(new Position(900, 600), 50, 15, PI/2);

}

void draw() {
  background(50);
  noStroke();
  fill(0);
  quad(BOARD_LEFT, BOARD_TOP, BOARD_RIGHT, BOARD_TOP, BOARD_RIGHT, BOARD_BOTTOM, BOARD_LEFT, BOARD_BOTTOM);
  frontFellOff.draw();
}
