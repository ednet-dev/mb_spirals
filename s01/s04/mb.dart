library mb;

import 'dart:html';

part 'board.dart';

// s01.s04

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.querySelector('#canvas');
  new Board(canvas);
}
