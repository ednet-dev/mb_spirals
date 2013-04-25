part of mb;

class Item {

  final Box box;

  int sequence; // sequence number within the box: 1, 2, ...
  String name;
  String category; // attribute, guid, identifier, required

  Item(this.box, this.name, this.category) {
    sequence = box.findLastItemSequence() + 10;
    box.items.add(this);
  }

}
