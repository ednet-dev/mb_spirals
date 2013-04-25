part of mb;

class JsonPanel {

  final Board board;

  TextAreaElement modelJsonTextArea;
  ButtonElement fromModelToJsonButton;
  ButtonElement fromJsonToModelButton;

  JsonPanel(this.board) {
    modelJsonTextArea = document.query('#modelJson');
    fromModelToJsonButton = document.query('#fromModelToJson');
    fromModelToJsonButton.onClick.listen((MouseEvent e) {
      modelJsonTextArea.value = board.toJson();
    });
    fromJsonToModelButton = document.query('#fromJsonToModel');
    fromJsonToModelButton.onClick.listen((MouseEvent e) {
      board.fromJson(modelJsonTextArea.value);
    });
  }

}
