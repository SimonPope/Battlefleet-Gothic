void startTurn() {
  startMovementPhase();
}

void endTurn() {
  redTurn = !redTurn;
  startTurn();
}
