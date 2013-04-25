library mb;

import 'dart:html';
import 'dart:async';

part 'board.dart';
part 'box.dart';
part 'line.dart';
part 'menu_bar.dart';
part 'tool_bar.dart';
part 'item.dart';

// See the style guide: http://www.dartlang.org/articles/style-guide/ .

// See the basics canvas tutorial:
// http://dev.opera.com/articles/view/html-5-canvas-the-basics/ .
// See the canvas painting tutorial:
// http://dev.opera.com/articles/view/html5-canvas-painting/ .

// For debugging use print() and CTRL+SHIFT+J to open the console in Chrome.

// s11.s03

class Point {
  num x, y;
  Point(this.x, this.y);
}

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  Board board = new Board(canvas);
}
