import 'package:flutter/material.dart';
import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/pages/checkout_page.dart';
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
          const CartList().p32().expand(),
          const Divider(),
          const _CartListTotal(),
        ],
      ),
    );
  }
}

class _CartListTotal extends StatelessWidget {
  const _CartListTotal();

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${cart.totalPrice}".text.xl5.make(),
          TextButton(onPressed: () {
 Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CheckoutAddressPage()));
          }, child: "Buy".text.make())
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    return cart.items.isEmpty
        ? "Nothing to Show".text.xl5.make().centered()
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => {
                      RemoveMutation(cart.items[index])
                    }, // setState for rendering the UI in flutter (_cart.remove we have written inside cart.dart in Model folder)
                  ),
                  title: cart.items[index].name.text.make(),
                ),
            itemCount: cart.items.length);
  }
}
