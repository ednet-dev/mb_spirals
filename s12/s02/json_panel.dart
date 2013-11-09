part of mb;

class JsonPanel {

  final Board board;

  TextAreaElement modelJsonTextArea;
  ButtonElement fromModelToJsonButton;
  ButtonElement fromJsonToModelButton;

  JsonPanel(this.board) {
    modelJsonTextArea = document.querySelector('#modelJson');
    fromModelToJsonButton = document.querySelector('#fromModelToJson');
    fromModelToJsonButton.onClick.listen((MouseEvent e) {
      modelJsonTextArea.value = board.toJson();
    });
    fromJsonToModelButton = document.querySelector('#fromJsonToModel');
    fromJsonToModelButton.onClick.listen((MouseEvent e) {
      board.fromJson(modelJsonTextArea.value);
    });
  }

}
