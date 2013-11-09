part of mb;

class JsonPanel {

  final Board board;

  TextAreaElement modelJsonTextArea;
  ButtonElement fromModelToJsonButton;
  ButtonElement fromJsonToModelButton;
  ButtonElement clearButton;

  JsonPanel(this.board) {
    modelJsonTextArea = document.querySelector('#modelJson');
    fromModelToJsonButton = document.querySelector('#fromModelToJson');
    fromModelToJsonButton.onClick.listen((MouseEvent e) {
      modelJsonTextArea.value =  board.toJson();
      modelJsonTextArea.select();
    });
    fromJsonToModelButton = document.querySelector('#fromJsonToModel');
    fromJsonToModelButton.onClick.listen((MouseEvent e) {
      board.fromJson(modelJsonTextArea.value);
    });
    clearButton = document.querySelector('#clearJson');
    clearButton.onClick.listen((MouseEvent e) {
      clear();
    });
  }

  void clear() {
    modelJsonTextArea.value = '';
  }

}

