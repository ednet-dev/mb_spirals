part of mb;

class Box {

  Board board;

  num x;
  num y;
  num width;
  num height;

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

  bool contains(num px, num py) {
    if ((px > x && px < x + width) && (py > y && py < y + height)) {
      return true;
    }
    return false;
  }

  // Change a position of the box with mouse mouvements.
  void onMouseMove(MouseEvent event) {
    if (contains(event.offset.x, event.offset.y)) {
      x = event.offset.x - width / 2;
      if (x < 0) x = 1;
      if (x > board.width - width) x = board.width - width - 1;
      y = event.offset.y - height / 2;
      if (y < 0) y = 1;
      if (y > board.height - height) y = board.height - height - 1;
    }
  }

}
