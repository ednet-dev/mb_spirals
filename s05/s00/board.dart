part of mb;

class Board {

  static const int INTERVAL = 8; // ms

  CanvasRenderingContext2D context;

  int width;
  int height;

  List<Box> boxes;

  Board(CanvasElement canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
    border();

    boxes = new List();

    // Canvas event
    document.querySelector('#canvas').onMouseDown.listen(onMouseDown);
    // Redraw every INTERVAL ms.
    new Timer.periodic(const Duration(milliseconds: INTERVAL), (t) => redraw());
  }

  void border() {
    context.beginPath();
    context.rect(0, 0, width, height);
    context.closePath();
    context.stroke();
  }

  void clear() {
    context.clearRect(0, 0, width, height);
    border();
  }

  void redraw() {
    clear();
    for (Box box in boxes) {
      box.draw();
    }
  }

  int get nextBoxNo => boxes.length + 1;

  int countSelectedBoxesContain(int pointX, int pointY) {
    int count = 0;
    for (Box box in boxes) {
      if (box.isSelected() && box.contains(pointX, pointY)) {
        count++;
      }
    }
    return count;
  }

  // Create a box in the position of the mouse click on the board,
  // but not on an existing box.
  void onMouseDown(MouseEvent e) {
    bool clickedOnBox = false;
    for (Box box in boxes) {
      if (box.contains(e.offset.x, e.offset.y)) {
        clickedOnBox = true;
        break;
      }
    }
    if (!clickedOnBox) {
      Box box = new Box(this, e.offset.x, e.offset.y,
        Box.DEFAULT_WIDTH, Box.DEFAULT_HEIGHT);
      if (e.offset.x + box.width > width) {
        box.x = width - box.width - 1;
      }
      if (e.offset.y + box.height > height) {
        box.y = height - box.height - 1;
      }
      boxes.add(box);
    }
  }

}
