import 'package:flutter/material.dart';
import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mytheme.creamColor,
      appBar: AppBar(
        title: "Cart".text.textStyle(context.bodyLarge).make(),
      ),
      body: Column(
        children: [
          CartList().p32().expand(),
          const Divider(),
          const _CartListTotal(),
        ],
      ),
    );
  }
}

class _CartListTotal extends StatelessWidget {
  const _CartListTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.make(),
          TextButton(onPressed: () {}, child: "Buy".text.make())
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to Show".text.xl5.make().centered()
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => {
                      RemoveMutation(_cart.items[index])
                    }, // setState for rendering the UI in flutter (_cart.remove we have written inside cart.dart in Model folder)
                  ),
                  title: _cart.items[index].name.text.make(),
                ),
            itemCount: _cart.items.length);
  }
}
