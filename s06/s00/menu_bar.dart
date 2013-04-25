part of mb;

class MenuBar {

  final Board board;

  ButtonElement createBoxesButton;
  ButtonElement deleteBoxesButton;

  MenuBar(this.board) {
    createBoxesButton = document.query('#create-boxes');
    deleteBoxesButton = document.query('#delete-boxes');

    // Menu bar events.
    createBoxesButton.onClick.listen((MouseEvent e) {
      board.createBoxes(6);
    });

    deleteBoxesButton.onClick.listen((MouseEvent e) {
      board.deleteBoxes();
    });
  }

}
