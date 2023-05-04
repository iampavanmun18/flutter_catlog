import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/models/catelogue.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCartButton extends StatefulWidget {
  final Item catalog;
  const AddToCartButton({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatelogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
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
