part of mb;

class JsonPanel {

  final Board board;

  TextAreaElement modelJsonTextArea;
  ButtonElement fromModelToJsonButton;

  JsonPanel(this.board) {
    modelJsonTextArea = document.querySelector('#modelJson');
    fromModelToJsonButton = document.querySelector('#fromModelToJson');
    fromModelToJsonButton.onClick.listen((MouseEvent e) {
      modelJsonTextArea.value =  board.toJson();
    });
  }

}
