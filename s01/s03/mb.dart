import 'dart:html';

// s01.s03

void displayBoxes(CanvasRenderingContext2D context) {
  context.beginPath();
  context.rect(20, 20, 40, 60);
  context.rect(120, 40, 60, 40);
  context.closePath();
  context.stroke();
}

void displayBord(CanvasElement canvas) {
  CanvasRenderingContext2D context = canvas.getContext("2d");
  int width = canvas.width;
  int height = canvas.height;
  context.beginPath();
  context.rect(0, 0, width, height);
  context.closePath();
  context.stroke();
  displayBoxes(context);
}

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = document.querySelector('#canvas');
  displayBord(canvas);
}
