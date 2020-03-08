void startMovementPhase() {
  gameState = GameState.GENERIC_MOVE;
  for (Ship ship : getEnemyShips()) {
    ship.setState(ShipState.STANDARD);
  }
  for (Ship ship : getCurrentShips()) {
    ship.setState(ShipState.UNUSED);
  }
}

void endMovementPhase() {
  endTurn();
}

void moveMouseClicked() {
  switch(gameState) {
    case GENERIC_MOVE:
      for (Ship ship : getCurrentShips()) {
        if (ship.getState() == ShipState.UNUSED && ship.within(mouseX, mouseY)) {
          moveSelectShip(ship);
          break;
        }
      }
      break;
    default:
      break;
  }
}

void moveSelectShip(Ship ship) {
  //TODO add confirmation
  if (selectedShip != null && selectedShip.getState() == ShipState.CURRENT) {
    selectedShip.setState(ShipState.USED);
  }
  selectedShip = ship;
  gameState = GameState.SHIP_SELECTED;
}

void moveKeyPressed() {
  //ENTER is deselct
  //SPACE is move to next phase
  switch(gameState) {
    case GENERIC_MOVE:
      if (key == ' ') {
        endMovementPhase();
      }
      break;
    case SHIP_SELECTED:
      if (key == ENTER) {
        selectedShip = null;
        gameState = GameState.GENERIC_MOVE;
      }
      if (key == ' ') {
        selectedShip.setState(ShipState.CURRENT);
        gameState = GameState.MOVE_AND_TURN;
      }
      break;
    case MOVE_AND_TURN:
      if (key == ENTER) {
        selectedShip.setState(ShipState.USED);
        selectedShip = null;
        gameState = GameState.GENERIC_MOVE;
      }
      break;
    default:
      break;
  }
}
