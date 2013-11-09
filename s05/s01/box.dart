part of mb;

class Box {

  static final num DEFAULT_WIDTH = 100;
  static final num DEFAULT_HEIGHT = 100;

  static final SSS = 6; // selection square size
  static final TBH = 20; // title box height
  static final TOS = 4; // text offset size
  static final IOS = TBH - TOS; // item offset size

  final Board board;

  num x;
  num y;
  num width;
  num height;

  String textFontSize = '12';
  String title = "Box";
  num titleNo;
  String item = "Item";

  bool _selected = false;
  bool _mouseDown = false;

  Box(this.board, this.x, this.y, this.width, this.height) {
    titleNo = board.nextBoxNo;
    draw();
    // Box events (actually, canvas events).
    document.querySelector('#canvas').onMouseDown.listen(onMouseDown);
    document.querySelector('#canvas').onMouseUp.listen(onMouseUp);
    document.querySelector('#canvas').onMouseMove.listen(onMouseMove);
  }

  void draw() {
    board.context.beginPath();
    board.context.rect(x, y, width, height);
    board.context.moveTo(x, y + TBH);
    board.context.lineTo(x + width, y + TBH);
    board.context.font = 'bold ${textFontSize}px sans-serif';
    board.context.textAlign = "start";
    board.context.textBaseline = "top";
    board.context.fillText(toString(), x + TOS, y + TOS, width - TOS);
    board.context.fillText('${item}1', x + TOS, y + TOS + TBH, width - TOS);
    board.context.fillText('${item}2', x + TOS, y + TOS + TBH + IOS, width - TOS);
    board.context.fillText('${item}3', x + TOS, y + TOS + TBH + 2 * IOS, width - TOS);
    board.context.fillText('${item}4', x + TOS, y + TOS + TBH + 3 * IOS, width - TOS);
    if (isSelected()) {
      board.context.rect(x, y, SSS, SSS);
      board.context.rect(x + width - SSS, y, SSS, SSS);
      board.context.rect(x + width - SSS, y + height - SSS, SSS, SSS);
      board.context.rect(x, y + height - SSS, SSS, SSS);
    }
    board.context.closePath();
    board.context.stroke();
  }

  select() => _selected = true;
  deselect() => _selected = false;
  toggleSelection() => _selected = !_selected;
  bool isSelected() => _selected;

  String toString() => '$title$titleNo ($x, $y)';

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
    if (contains(e.offset.x, e.offset.y)) {
      toggleSelection();
    }
  }

  void onMouseUp(MouseEvent e) {
    _mouseDown = false;
  }

  // Change a position of the box with mouse mouvements.
  void onMouseMove(MouseEvent e) {
    if (contains(e.offset.x, e.offset.y) && isSelected() && _mouseDown &&
        board.countSelectedBoxesContain(e.offset.x, e.offset.y) < 2) {
      x =  e.offset.x - width / 2;
      if (x < 0) {
        x = 1;
      }
      if (x > board.width - width) {
        x = board.width - width - 1;
      }
      y = e.offset.y - height / 2;
      if (y < 0) {
        y = 1;
      }
      if (y > board.height - height) {
        y = board.height - height - 1;
      }
    }
  }

}
