// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_catlog/Audio_Page/page1_audio.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catlog/models/catelogue.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({required Key key, required this.catalog})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.red400.make(),
              ElevatedButton(
                onPressed: () {
                 Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MyApp()),
                          );                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Mytheme.darkbluishColor,
                    ),
                    shape: MaterialStateProperty.all(
                      const StadiumBorder(),
                    )),
                child: "Add To Cart".text.make(),
              ).wh(120, 50)
            ],
          ).p24(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .p16(),
              Expanded(
                  child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl2
                        .color(Mytheme.darkbluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    10.heightBox,
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p32(),
                  ],
                ),
              ))
            ],
          ),
        ).p16());
  }
}
