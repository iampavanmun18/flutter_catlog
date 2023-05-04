import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/models/catelogue.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatelogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatelogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
