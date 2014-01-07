part of mb;

class PngPanel {

  final Board board;

  ButtonElement fromModelToPngButton;

  PngPanel(this.board) {
    fromModelToPngButton = document.querySelector('#fromModelToPng');
    fromModelToPngButton.onClick.listen((MouseEvent e) {
      //board.toPng();
      toPng();
    });
  }

  void toPng() {
    ImageElement modelImage = document.querySelector('#modelImage');
    modelImage.src = board.canvas.toDataUrl("image/png");
  }

}
