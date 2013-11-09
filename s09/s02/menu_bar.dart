part of mb;

class MenuBar {

  final Board board;

  // File
  ButtonElement saveAsPngButton;

  // Edit
  ButtonElement selectAllButton;
  ButtonElement deleteSelectionButton;

  // View
  ButtonElement increaseSelectionHeightButton;
  ButtonElement decreaseSelectionHeightButton;
  ButtonElement increaseSelectionWidthButton;
  ButtonElement decreaseSelectionWidthButton;
  ButtonElement increaseSelectionSizeButton;
  ButtonElement decreaseSelectionSizeButton;
  ButtonElement hideSelectionButton;
  ButtonElement showHiddenSelectionButton;

  // Creaete
  ButtonElement createBoxesInDiagonalButton;
  ButtonElement createBoxesAsTilesButton;

  MenuBar(this.board) {
    saveAsPngButton = document.querySelector('#save-as-png');

    selectAllButton = document.querySelector('#select-all');
    deleteSelectionButton = document.querySelector('#delete-selection');

    increaseSelectionHeightButton = document.querySelector('#increase-selection-height');
    decreaseSelectionHeightButton = document.querySelector('#decrease-selection-height');
    increaseSelectionWidthButton = document.querySelector('#increase-selection-width');
    decreaseSelectionWidthButton = document.querySelector('#decrease-selection-width');
    increaseSelectionSizeButton = document.querySelector('#increase-selection-size');
    decreaseSelectionSizeButton = document.querySelector('#decrease-selection-size');
    hideSelectionButton = document.querySelector('#hide-selection');
    showHiddenSelectionButton = document.querySelector('#show-hidden-selection');

    createBoxesInDiagonalButton = document.querySelector('#create-boxes-in-diagonal');
    createBoxesAsTilesButton = document.querySelector('#create-boxes-as-tiles');

    // Menu bar events.
    saveAsPngButton.onClick.listen((MouseEvent e) {
      board.saveAsPng();
    });

    selectAllButton.onClick.listen((MouseEvent e) {
      board.select();
    });
    deleteSelectionButton.onClick.listen((MouseEvent e) {
      board.deleteSelection();
    });

    increaseSelectionHeightButton.onClick.listen((MouseEvent e) {
      board.increaseHeightOfSelectedBoxes();
    });
    decreaseSelectionHeightButton.onClick.listen((MouseEvent e) {
      board.decreaseHeightOfSelectedBoxes();
    });
    increaseSelectionWidthButton.onClick.listen((MouseEvent e) {
      board.increaseWidthOfSelectedBoxes();
    });
    decreaseSelectionWidthButton.onClick.listen((MouseEvent e) {
      board.decreaseWidthOfSelectedBoxes();
    });
    increaseSelectionSizeButton.onClick.listen((MouseEvent e) {
      board.increaseSizeOfSelectedBoxes();
    });
    decreaseSelectionSizeButton.onClick.listen((MouseEvent e) {
      board.decreaseSizeOfSelectedBoxes();
    });
    hideSelectionButton.onClick.listen((MouseEvent e) {
      board.hideSelection();
    });
    showHiddenSelectionButton.onClick.listen((MouseEvent e) {
      board.showHiddenSelection();
    });

    createBoxesInDiagonalButton.onClick.listen((MouseEvent e) {
      board.createBoxesInDiagonal();
    });
    createBoxesAsTilesButton.onClick.listen((MouseEvent e) {
      board.createBoxesAsTiles();
    });
  }

}
