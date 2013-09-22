library mb;

import 'dart:html';
import 'dart:async';
import 'dart:convert';

part 'board.dart';
part 'box.dart';
part 'line.dart';
part 'menu_bar.dart';
part 'tool_bar.dart';
part 'item.dart';
part 'png_panel.dart';
part 'json_panel.dart';

// See the style guide: http://www.dartlang.org/articles/style-guide/ .

// See the basics canvas tutorial:
// http://dev.opera.com/articles/view/html-5-canvas-the-basics/ .
// See the canvas painting tutorial:
// http://dev.opera.com/articles/view/html5-canvas-painting/ .

// For debugging use print() and CTRL+SHIFT+J to open the console in Chrome.

// s12.s02

class Point {
  num x, y;
  Point(this.x, this.y);
}

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  Board board = new Board(canvas);
}
