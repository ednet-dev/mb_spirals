part of mb;

class MenuBar {

  final Board board;

  ButtonElement selectBoxesButton;
  ButtonElement deleteSelectedBoxesButton;
  ButtonElement hideSelectedBoxesButton;
  ButtonElement showHiddenBoxesButton;

  MenuBar(this.board) {
    selectBoxesButton = document.querySelector('#select-boxes');
    deleteSelectedBoxesButton = document.querySelector('#delete-selected-boxes');
    hideSelectedBoxesButton = document.querySelector('#hide-selected-boxes');
    showHiddenBoxesButton = document.querySelector('#show-hidden-boxes');

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