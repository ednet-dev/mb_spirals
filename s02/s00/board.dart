part of mb;

class Board {

  int x = 0;
  int y = 0;
  int width;
  int height;

  CanvasRenderingContext2D context;

  Box box1;
  Box box2;

  Board(CanvasElement canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
    border();
    init();
    // Redraw every 10 ms.
    new Timer.periodic(const Duration(milliseconds: 10), (t) => redraw());
  }

  void init() {
    box1 = new Box(this, 20, 20, 40, 60);
    box2 = new Box(this, 120, 40, 60, 40);
  }

  void border() {
    context.beginPath();
    context.rect(x, y, width, height);
    context.closePath();
    context.stroke();
  }

  void redraw() {
    box1.draw();
    box2.draw();
  }

}
