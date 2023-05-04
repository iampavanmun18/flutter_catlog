import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/models/catelogue.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //make singleton class for not making multiple objects so that addtocart won't start with zero everytime.
  // static final cartModel = CartModel._internal();

  // CartModel._internal();

  // factory CartModel() => cartModel;
  // catalog field
  late CatelogModel _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatelogModel get catalog => _catalog;

  set catalog(CatelogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
