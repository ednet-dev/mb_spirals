library mb;

import 'dart:html';

part 'board.dart';
part 'box.dart';

// s01.s05

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  Board board = new Board(canvas);
}
