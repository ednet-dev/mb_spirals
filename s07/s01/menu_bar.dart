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
    selectAllButton = document.querySelector('#select-all');
    deleteSelectionButton = document.querySelector('#delete-selection');

    hideSelectionButton = document.querySelector('#hide-selection');
    showHiddenSelectionButton = document.querySelector('#show-hidden-selection');

    createBoxesInDiagonalButton = document.querySelector('#create-boxes-in-diagonal');
    createBoxesAsTilesButton = document.querySelector('#create-boxes-as-tiles');

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