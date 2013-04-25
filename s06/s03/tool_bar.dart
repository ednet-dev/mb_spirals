part of mb;

class ToolBar {

  static final int SELECT = 1;
  static final int BOX = 2;
  static final int LINE = 3;

  final Board board;

  int _onTool = SELECT;
  bool _selectToolDblClicked = true;

  ToolBar(this.board) {
    ButtonElement selectButton = document.query('#select');
    ButtonElement boxButton = document.query('#box');
    ButtonElement lineButton = document.query('#line');

    // Tool bar events.
    selectButton.onClick.listen((MouseEvent e) {
      _onTool = SELECT;
    });
    selectButton.onDoubleClick.listen((MouseEvent e) {
      _onTool = SELECT;
      _selectToolDblClicked = true;
    });

    boxButton.onClick.listen((MouseEvent e) {
      _onTool = BOX;
    });
    boxButton.onDoubleClick.listen((MouseEvent e) {
      _onTool = BOX;
      _selectToolDblClicked = false;
    });

    lineButton.onClick.listen((MouseEvent e) {
      _onTool = LINE;
    });
    lineButton.onDoubleClick.listen((MouseEvent e) {
      _onTool = LINE;
      _selectToolDblClicked = false;
    });
  }

  bool isSelectToolOn() {
    if (_onTool == SELECT) {
      return true;
    }
    return false;
  }

  bool isBoxToolOn() {
    if (_onTool == BOX) {
      return true;
    }
    return false;
  }

  bool isLineToolOn() {
    if (_onTool == LINE) {
      return true;
    }
    return false;
  }

  void selectToolOn()  {
    if (_selectToolDblClicked) {
      _onTool = SELECT;
    }
  }

}
