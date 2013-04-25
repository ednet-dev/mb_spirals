part of mb;

class JsonPanel {

  final Board board;

  TextAreaElement modelJsonTextArea;
  ButtonElement fromModelToJsonButton;

  JsonPanel(this.board) {
    modelJsonTextArea = document.query('#modelJson');
    fromModelToJsonButton = document.query('#fromModelToJson');
    fromModelToJsonButton.onClick.listen((MouseEvent e) {
      modelJsonTextArea.value =  board.toJson();
    });
  }

}
