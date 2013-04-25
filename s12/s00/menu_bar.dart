part of mb;

class MenuBar {

  final Board board;

  // File
  ButtonElement saveModelButton;

  // Edit
  ButtonElement deleteSelectionButton;

  // Select
  ButtonElement selectAllButton;
  ButtonElement selectBoxesButton;
  ButtonElement selectLinesButton;
  ButtonElement selectBoxLinesButton;
  ButtonElement selectLinesBetweenBoxesButton;

  // View
  ButtonElement increaseSelectionHeightButton;
  ButtonElement decreaseSelectionHeightButton;
  ButtonElement increaseSelectionWidthButton;
  ButtonElement decreaseSelectionWidthButton;
  ButtonElement increaseSelectionSizeButton;
  ButtonElement decreaseSelectionSizeButton;
  ButtonElement hideSelectionButton;
  ButtonElement hideNonSelectionButton;
  ButtonElement showHiddenButton;

  // Create
  ButtonElement createBoxesInDiagonalButton;
  ButtonElement createBoxesAsTilesButton;

  MenuBar(this.board) {
    saveModelButton = document.query('#save-model');

    deleteSelectionButton = document.query('#delete-selection');

    selectAllButton = document.query('#select-all');
    selectBoxesButton = document.query('#select-boxes');
    selectLinesButton = document.query('#select-lines');
    selectBoxLinesButton = document.query('#select-box-lines');
    selectLinesBetweenBoxesButton =
      document.query('#select-lines-between-boxes');

    increaseSelectionHeightButton =
      document.query('#increase-selection-height');
    decreaseSelectionHeightButton =
      document.query('#decrease-selection-height');
    increaseSelectionWidthButton = document.query('#increase-selection-width');
    decreaseSelectionWidthButton = document.query('#decrease-selection-width');
    increaseSelectionSizeButton = document.query('#increase-selection-size');
    decreaseSelectionSizeButton = document.query('#decrease-selection-size');
    hideSelectionButton = document.query('#hide-selection');
    hideNonSelectionButton = document.query('#hide-non-selection');
    showHiddenButton = document.query('#show-hidden');

    createBoxesInDiagonalButton = document.query('#create-boxes-in-diagonal');
    createBoxesAsTilesButton = document.query('#create-boxes-as-tiles');

    // Menu bar events.
    saveModelButton.onClick.listen((MouseEvent e) {
      board.saveModel();
    });

    deleteSelectionButton.onClick.listen((MouseEvent e) {
      board.deleteSelection();
    });

    selectAllButton.onClick.listen((MouseEvent e) {
      board.select();
    });
    selectBoxesButton.onClick.listen((MouseEvent e) {
      board.selectBoxes();
    });
    selectLinesButton.onClick.listen((MouseEvent e) {
      board.selectLines();
    });
    selectBoxLinesButton.onClick.listen((MouseEvent e) {
      board.selectBoxLines();
    });
    selectLinesBetweenBoxesButton.onClick.listen((MouseEvent e) {
      board.selectLinesBetweenBoxes();
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
    hideNonSelectionButton.onClick.listen((MouseEvent e) {
      board.hideNonSelection();
    });
    showHiddenButton.onClick.listen((MouseEvent e) {
      board.showHidden();
    });

    createBoxesInDiagonalButton.onClick.listen((MouseEvent e) {
      board.createBoxesInDiagonal();
    });
    createBoxesAsTilesButton.onClick.listen((MouseEvent e) {
      board.createBoxesAsTiles();
    });
  }

}
