import 'dart:html';

// s01.s02

void displayBoxes(CanvasElement canvas) {
  CanvasRenderingContext2D context = canvas.getContext("2d");
  int width = canvas.width;
  int height = canvas.height;
  context.beginPath();
  // border
  context.rect(0, 0, width, height);
  // box 1
  context.rect(20, 20, 40, 60);
  // box 2
  context.rect(120, 40, 60, 40);
  context.closePath();
  context.stroke();
}

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.query('#canvas');
  displayBoxes(canvas);
}
