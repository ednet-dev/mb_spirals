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
    board.context.fillText('${x.toString()},${y.toString()}', x + 1, y + 10);
    board.context.closePath();
    board.context.stroke();
  }

  bool isPointInside(num px, num py) {
    if ((px > x && px < x + width) && (py > y && py < y + height)) {
      return true;
    }
    return false;
  }

  // Change a position of the box with mouse mouvements.
  void onMouseMove(MouseEvent event) {
    if (isPointInside(event.offsetX, event.offsetY)) {
      x = event.offset.x - width / 2;
      y = event.offset.y - height / 2;
    }
  }

}
