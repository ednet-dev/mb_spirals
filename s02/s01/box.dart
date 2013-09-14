part of mb;

class Box {

  Board board;

  int x;
  int y;
  int width;
  int height;

  Box(this.board, this.x, this.y, this.width, this.height) {
    draw();
    document.onMouseMove.listen(onMouseMove);
  }

  void draw() {
    board.context.beginPath();
    board.context.rect(x, y, width, height);
    board.context.closePath();
    board.context.stroke();
  }

  // Change a position of the box with mouse mouvements.
  void onMouseMove(MouseEvent event) {
    x = event.offset.x;
    y = event.offset.y;
  }

}
