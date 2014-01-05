part of mb;

class Box {

  static const int SSS = 6; // selection square size

  final Board board;

  num x;
  num y;
  num width;
  num height;

  bool selected = false;

  Box(this.board, this.x, this.y, this.width, this.height) {
    draw();
    document.onMouseDown.listen(onMouseDown);
    document.onMouseUp.listen(onMouseUp);
    document.onMouseMove.listen(onMouseMove);
  }

  void draw() {
    board.context.beginPath();
    board.context.rect(x, y, width, height);
    if (isSelected()) {
      board.context.rect(x, y, SSS, SSS);
      board.context.rect(x + width - SSS, y, SSS, SSS);
      board.context.rect(x + width - SSS, y + height - SSS, SSS, SSS);
      board.context.rect(x, y + height - SSS, SSS, SSS);
    }
    board.context.closePath();
    board.context.stroke();
  }

  void select() {
    selected = true;
  }

  void deselect() {
    selected = false;
  }

  void toggleSelection() {
    selected = !selected;
  }

  bool isSelected() {
    return selected;
  }

  bool contains(num px, num py) {
    if ((px > x && px < x + width) && (py > y && py < y + height)) {
      return true;
    }
    return false;
  }

  void onMouseDown(MouseEvent event) {
    // if (contains(event.offset.x, event.offset.y)) toggleSelection();
  }

  void onMouseUp(MouseEvent event) {
    if (contains(event.offset.x, event.offset.y)) toggleSelection();
  }

  // Change a position of the box with mouse mouvements.
  void onMouseMove(MouseEvent event) {
    if (isSelected() && contains(event.offset.x, event.offset.y)) {
      x = event.offset.x - width / 2;
      if (x < 0) x = 1;
      if (x > board.width - width) x = board.width - width - 1;
      y = event.offset.y - height / 2;
      if (y < 0) y = 1;
      if (y > board.height - height) y = board.height - height - 1;
    }
  }

}
