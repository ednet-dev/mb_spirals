part of mb;

class Box {

  static final num DEFAULT_WIDTH = 100;
  static final num DEFAULT_HEIGHT = 100;

  static final num SSS = 6; // selection square size
  static final num TBH = 20; // title box height
  static final num TOS = 4; // text offset size
  static final num IOS = TBH - TOS; // item offset size

  final Board board;

  String _name = 'Box';
  num x;
  num y;
  num width;
  num height;

  bool _selected = false;
  bool _hidden = false;
  bool _mouseDown = false;

  String textFontSize = '12';
  num defaultLineWidth;

  Box(this.board, this.x, this.y, this.width, this.height) {
    defaultLineWidth = board.context.lineWidth;
    draw();
    // Box events (actually, canvas events).
    document.query('#canvas').onMouseDown.listen(onMouseDown);
    document.query('#canvas').onMouseUp.listen(onMouseUp);
    document.query('#canvas').onMouseMove.listen(onMouseMove);
  }

  void draw() {
    if (!isHidden()) {
      board.context.beginPath();
      board.context.rect(x, y, width, height);
      board.context.moveTo(x, y + TBH);
      board.context.lineTo(x + width, y + TBH);
      board.context.font = 'bold ${textFontSize}px sans-serif';
      board.context.textAlign = "start";
      board.context.textBaseline = "top";
      board.context.fillText(title, x + TOS, y + TOS, width - TOS);
      if (isSelected()) {
        board.context.rect(x, y, SSS, SSS);
        board.context.rect(x + width - SSS, y, SSS, SSS);
        board.context.rect(x + width - SSS, y + height - SSS, SSS, SSS);
        board.context.rect(x, y + height - SSS, SSS, SSS);
      }
      board.context.lineWidth = defaultLineWidth;
      board.context.closePath();
      board.context.stroke();
    }
  }

  void select() {
    _selected = true;
    board.lastBoxSelected = this;
  }

  void deselect() {
    _selected = false;
    board.lastBoxSelected = null;
  }

  void toggleSelection() {
    _selected = !_selected;
    if (_selected) {
      board.lastBoxSelected = this;
    } else {
      board.lastBoxSelected = null;
    }
  }

  bool isSelected() => _selected;

  hide() => _hidden = true;
  show() => _hidden = false;
  bool isHidden() => _hidden;

  void set title(String name) {
    _name = name;
  }

  String get title {
    return _name;
  }

  String toString() => '$title ($x, $y)';

  Point center() {
    num centerX = x + width / 2;
    num centerY = y + height / 2;
    return new Point(centerX, centerY);
  }

  bool contains(num pointX, num pointY) {
    if ((pointX > x && pointX < x + width)
        && (pointY > y && pointY < y + height)) {
      return true;
    }
    else {
      return false;
    }
  }

  void onMouseDown(MouseEvent e) {
    _mouseDown = true;
    if (board.toolBar.isSelectToolOn() && contains(e.offsetX, e.offsetY)) {
      toggleSelection();
    }
    if (contains(e.offsetX, e.offsetY)) {
      if (board.lastBoxClicked != null && board.lastBoxClicked != this) {
        board.beforeLastBoxClicked = board.lastBoxClicked;
      }
      board.lastBoxClicked = this;
    }
  }

  void onMouseUp(MouseEvent e) {
    _mouseDown = false;
  }

  /** Change a position of the box with mouse mouvements. */
  void onMouseMove(MouseEvent e) {
    if (contains(e.offsetX, e.offsetY) && isSelected() && _mouseDown &&
        board.countSelectedBoxesContain(e.offsetX, e.offsetY) < 2) {
      x =  e.offsetX - width / 2;
      if (x < 0) {
        x = 1;
      }
      if (x > board.width - width) {
        x = board.width - width - 1;
      }
      y = e.offsetY - height / 2;
      if (y < 0) {
        y = 1;
      }
      if (y > board.height - height) {
        y = board.height - height - 1;
      }
    }
  }

}
