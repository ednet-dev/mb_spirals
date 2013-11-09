library mb;

import 'dart:html';
import 'dart:async';

part 'board.dart';
part 'box.dart';

// s02.s01

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.querySelector('#canvas');
  Board board = new Board(canvas);
}
