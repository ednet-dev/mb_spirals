import 'dart:html';

// s01.s00

main() {
  // Get a reference to the canvas.
  var canvas = document.querySelector('#canvas');
  var context = canvas.getContext("2d");
  var width = canvas.width;
  var height = canvas.height;
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
