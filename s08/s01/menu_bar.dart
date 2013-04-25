part of mb;

class MenuBar {

  final Board board;

  // Edit
  ButtonElement selectAllButton;
  ButtonElement deleteSelectionButton;

  // View
  ButtonElement hideSelectionButton;
  ButtonElement showHiddenSelectionButton;

  // Creaete
  ButtonElement createBoxesInDiagonalButton;
  ButtonElement createBoxesAsTilesButton;

  MenuBar(this.board) {
    selectAllButton = document.query('#select-all');
    deleteSelectionButton = document.query('#delete-selection');

    hideSelectionButton = document.query('#hide-selection');
    showHiddenSelectionButton = document.query('#show-hidden-selection');

    createBoxesInDiagonalButton = document.query('#create-boxes-in-diagonal');
    createBoxesAsTilesButton = document.query('#create-boxes-as-tiles');

    // Menu bar events.
    selectAllButton.onClick.listen((MouseEvent e) {
      board.select();
    });
    deleteSelectionButton.onClick.listen((MouseEvent e) {
      board.deleteSelection();
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
