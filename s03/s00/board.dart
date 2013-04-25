part of mb;

class Board {

  static const int INTERVAL = 10; // ms

  int width;
  int height;

  CanvasRenderingContext2D context;

  List<Box> boxes;

  Board(CanvasElement canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
    border();
    boxes = new List();
    document.onMouseDown.listen(onMouseDown);
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

  // Create a box in the position of the mouse click on the board.
  void onMouseDown(MouseEvent event) {
    Box box = new Box(this, event.offsetX, event.offsetY, 60, 100);
    boxes.add(box);
  }

}
