class Item {
  final String _item;

  String get name => _item;

  Item(this._item);

  factory Item.fromJson(dynamic json) {
    return Item(json['name'] as String);
  }

  Map toMap() {
    return {
      "name": _item,
    };
  }
}
