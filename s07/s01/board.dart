part of mb;

class Board {

  // The acceptable delta error in pixels for clicking on a line between two boxes.
  static final int DELTA = 8;
  // The board is redrawn every INTERVAL ms.
  static const int INTERVAL = 8;

  CanvasRenderingContext2D context;

  int width;
  int height;

  List<Box> boxes;
  List<Line> lines;

  Box beforeLastBoxClicked;
  Box lastBoxClicked;

  MenuBar menuBar;
  ToolBar toolBar;

  Board(CanvasElement canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
    border();

    boxes = new List();
    lines = new List();

    menuBar = new MenuBar(this);
    toolBar = new ToolBar(this);

    // Canvas event
    document.query('#canvas').onMouseDown.listen(onMouseDown);
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
    for (Line line in lines) {
      line.draw();
    }
  }

  void createBoxesInDiagonal() {
    int x = 0; int y = 0;
    while (true) {
      if (x <= width - Box.DEFAULT_WIDTH && y <= height - Box.DEFAULT_HEIGHT) {
        Box box = new Box(this, x, y, Box.DEFAULT_WIDTH, Box.DEFAULT_HEIGHT);
        boxes.add(box);
        x = x + Box.DEFAULT_WIDTH;
        y = y + Box.DEFAULT_HEIGHT;
      } else {
        return;
      }
    }
  }

  void createBoxesAsTiles() {
    int x = 0; int y = 0;
    while (true) {
      if (x <= width - Box.DEFAULT_WIDTH) {
        Box box = new Box(this, x, y, Box.DEFAULT_WIDTH, Box.DEFAULT_HEIGHT);
        boxes.add(box);
        x = x + Box.DEFAULT_WIDTH * 2;
      } else {
        x = 0;
        y = y + Box.DEFAULT_HEIGHT * 2;
        if (y > height - Box.DEFAULT_HEIGHT) {
          return;
        }
      }
    }
  }

  void deleteBoxes() {
    boxes.clear();
  }

  void deleteLines() {
    lines.clear();
  }

  void deleteSelectedBoxes() {
    boxes.removeWhere((b) => b.isSelected());
  }

  void deleteSelectedLines() {
    lines.removeWhere((l) => l.isSelected());
  }

  void deleteSelection() {
    deleteSelectedLines();
    deleteSelectedBoxes();
  }

  void selectBoxes() {
    for (Box box in boxes) {
      box.select();
    }
  }

  void selectLines() {
    for (Line line in lines) {
      line.select();
    }
  }

  void select() {
    selectBoxes();
    selectLines();
  }

  void deselectBoxes() {
    for (Box box in boxes) {
      box.deselect();
    }
  }

  void deselectLines() {
    for (Line line in lines) {
      line.deselect();
    }
  }

  void deselect() {
    deselectBoxes();
    deselectLines();
  }

  void hideSelectedBoxes() {
    for (Box box in boxes) {
      if (box.isSelected()) {
        box.hide();
      }
    }
  }

  void hideSelectedLines() {
    for (Line line in lines) {
      if (line.isSelected()) {
        line.hide();
      }
    }
  }

  void hideSelection() {
    hideSelectedBoxes();
    hideSelectedLines();
  }

  void showHiddenBoxes() {
    for (Box box in boxes) {
      if (box.isHidden()) {
        box.show();
      }
    }
  }

  void showHiddenLines() {
    for (Line line in lines) {
      if (line.isHidden()) {
        line.show();
      }
    }
  }

  void showHiddenSelection() {
    showHiddenBoxes();
    showHiddenLines();
  }

  int get nextBoxNo => boxes.length + 1;

  int countSelectedBoxes() {
    int count = 0;
    for (Box box in boxes) {
      if (box.isSelected()) {
        count++;
      }
    }
    return count;
  }

  int countSelectedLines() {
    int count = 0;
    for (Line line in lines) {
      if (line.isSelected()) {
        count++;
      }
    }
    return count;
  }

  int countSelectedBoxesContain(int pointX, int pointY) {
    int count = 0;
    for (Box box in boxes) {
      if (box.isSelected() && box.contains(pointX, pointY)) {
        count++;
      }
    }
    return count;
  }

  int countSelectedLinesContain(int pointX, int pointY) {
    Point delta = new Point(DELTA, DELTA);
    int count = 0;
    for (Line line in lines) {
      if (line.isSelected()
          && line.contains(new Point(pointX, pointY), delta)) {
        count++;
      }
    }
    return count;
  }

  Line _lineContains(Point point) {
    Point delta = new Point(DELTA, DELTA);
    for (Line line in lines) {
      if (line.contains(point, delta)) {
        return line;
      }
    }
  }

  void onMouseDown(MouseEvent e) {
    bool clickedOnBox = false;
    for (Box box in boxes) {
      if (box.contains(e.offset.x, e.offset.y)) {
        clickedOnBox = true;
        break;
      }
    }

    if (!clickedOnBox) {
      if (toolBar.isSelectToolOn()) {
        Point clickedPoint = new Point(e.offset.x, e.offset.y);
        Line line = _lineContains(clickedPoint);
        if (line != null) {
          // Select or deselect the existing line.
          line.toggleSelection();
        } else {
          // Deselect all.
          deselect();
        }
      } else if (toolBar.isBoxToolOn()) {
        Box box = new Box(this, e.offset.x, e.offset.y,
          Box.DEFAULT_WIDTH, Box.DEFAULT_HEIGHT);
        if (e.offset.x + box.width > width) {
          box.x = width - box.width - 1;
        }
        if (e.offset.y + box.height > height) {
          box.y = height - box.height - 1;
        }
        boxes.add(box);
        toolBar.selectToolOn();
      } else if (toolBar.isLineToolOn()) {
        if (beforeLastBoxClicked != null && lastBoxClicked != null) {
          Line line = new Line(this, beforeLastBoxClicked, lastBoxClicked);
          lines.add(line);
        }
        toolBar.selectToolOn();
      }
    }
  }

}
