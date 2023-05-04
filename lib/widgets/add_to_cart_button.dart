import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/models/catelogue.dart';
import 'package:flutter_catlog/pages/add_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartButton extends StatelessWidget {
  final Item catalog;
  AddToCartButton({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatelogModel();
          _cart.catalog = _catalog;
          _cart.add(catalog);
        }
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
        const StadiumBorder(),
      )),
      child: isInCart
          ? const Icon(Icons.done)
          : Icon(CupertinoIcons.shopping_cart),
    );
  }
}
