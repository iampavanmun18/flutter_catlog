class CatelogModel {
  static List<Item>? items = null;

//get item by Id
  static Item getById(int id) =>
      items!.firstWhere((element) => element.id == id,
          orElse: null); //to get element by matching  selected element with id

//get item by position
  static Item getByPosition(int pos) => items![pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
}
