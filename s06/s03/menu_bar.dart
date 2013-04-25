part of mb;

class MenuBar {

  final Board board;

  ButtonElement selectBoxesButton;
  ButtonElement deleteSelectedBoxesButton;
  ButtonElement hideSelectedBoxesButton;
  ButtonElement showHiddenBoxesButton;

  MenuBar(this.board) {
    selectBoxesButton = document.query('#select-boxes');
    deleteSelectedBoxesButton = document.query('#delete-selected-boxes');
    hideSelectedBoxesButton = document.query('#hide-selected-boxes');
    showHiddenBoxesButton = document.query('#show-hidden-boxes');

    // Menu bar events.
    selectBoxesButton.onClick.listen((MouseEvent e) {
      board.selectBoxes();
    });

    deleteSelectedBoxesButton.onClick.listen((MouseEvent e) {
      board.deleteSelectedBoxes();
    });

    hideSelectedBoxesButton.onClick.listen((MouseEvent e) {
      board.hideSelectedBoxes();
    });

    showHiddenBoxesButton.onClick.listen((MouseEvent e) {
      board.showHiddenBoxes();
    });
  }

}