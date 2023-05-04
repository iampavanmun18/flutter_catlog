import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catlog/core/store.dart';
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
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
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
