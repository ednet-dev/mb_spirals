part of magic_boxes;

class Board {
  num width;
  num height;
  CanvasElement canvas;
  CanvasRenderingContext2D context;
  List<Box> boxes = new List();

  Board(this.canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
    border();
    canvas.onMouseDown.listen((MouseEvent event) {
      Box box = new Box(this, event.offset.x, event.offset.y, 60, 100);
      bool clickedOnExistingBox = false;
      for (Box box in boxes) {
        if (box.contains(event.offset.x, event.offset.y)) {
          clickedOnExistingBox = true;
          break;
        }
      }
      if (!clickedOnExistingBox) {
        if (event.offset.x + box.width > width) box.x = width - box.width;
        if (event.offset.y + box.height > height) box.y = height - box.height;
        boxes.add(box);
      }
    });
    window.animationFrame.then(drawLoop);
  }

  void drawLoop(num delta) {
    draw();
    window.animationFrame.then(drawLoop);
  }

  void border() {
    context
      ..beginPath()
      ..rect(0, 0, width, height)
      ..closePath()
      ..stroke();
  }

  void clear() {
    context.clearRect(0, 0, width, height);
    border();
  }

  void draw() {
    clear();
    for (Box box in boxes) box.draw();
  }
}
