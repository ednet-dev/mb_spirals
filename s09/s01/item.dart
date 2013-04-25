part of mb;

class Item {

  final Box box;

  String name;
  String category;

  Item(this.box, this.name, this.category) {
    box.items.add(this);
  }

}
