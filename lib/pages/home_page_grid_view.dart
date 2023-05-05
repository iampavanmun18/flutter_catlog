import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/utils/routes.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catelogue.dart';
import '../widgets/home_widgets/catelog_header.dart';
import '../widgets/home_widgets/catlog_list.dart';

class HomePageGrid extends StatefulWidget {
  const HomePageGrid({super.key});

  @override
  State<HomePageGrid> createState() => _HomePageGridState();
}

class _HomePageGridState extends State<HomePageGrid> {
  @override
  void initState() {

    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catlogJson =
        await rootBundle.loadString('../../assets/files/catelog.json');
    final decodeData = jsonDecode(catlogJson);
    var productsData = decodeData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    print(productsData);
    setState(() {}); //to re-render the page
  }

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return Scaffold(
        appBar: AppBar(
          title: "Home".text.textStyle(context.bodyLarge).make(),
        ),
        floatingActionButton: VxBuilder(
          builder: (BuildContext context, store, VxStatus? status) =>
              FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.cartRoute);
                  },
                  child: Icon(CupertinoIcons.cart).badge(
                      size: 20,
                      color: Colors.red,
                      count: _cart.items.length,
                      textStyle: TextStyle(color: Colors.white, fontSize: 20))),
          mutations: {AddMutation, RemoveMutation},
        ),
        backgroundColor: Mytheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child:
                        const CircularProgressIndicator().centered().expand(),
                  )
              ],
            ),
          ),
        ));
  }
}
