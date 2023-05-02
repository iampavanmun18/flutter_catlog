import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catlog/widgets/drawer.dart';
import 'package:flutter_catlog/pages/login_page.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catelogue.dart';
import '../widgets/item_widget.dart';

class HomePageGrid extends StatefulWidget {
  const HomePageGrid({super.key});

  @override
  State<HomePageGrid> createState() => _HomePageGridState();
}

class _HomePageGridState extends State<HomePageGrid> {
  @override
  void initState() {
    // TODO: implement initState
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
    return const Scaffold(
      // themeMode: ThemeMode.dark, // add dark theme
      // theme: ThemeData(primarySwatch: Colors.blue),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      // debugShowCheckedModeBanner: false,
      body: SafeArea(
        child: CatelogHeader(),
      ),
    );
  }
}

class CatelogHeader extends StatelessWidget {
  const CatelogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Vx.m32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catelog App".text.xl5.bold.color(Mytheme.darkbluishColor).make(),
          "Trending Products".text.make(),
        ],
      ),
    );
  }
}
