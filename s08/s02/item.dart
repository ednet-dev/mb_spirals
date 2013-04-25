part of mb;

class Item {

  final Box box;

  String name;

  Item(this.box, String name) {
    this.name = name;
    box.items.add(this);
  }

}
