import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catlog/widgets/drawer.dart';

import '../models/catelogue.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
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
    // final dummyList = List.generate(50, (index) => CatelogModel.items[0]);
    // print(dummyList);

    int days = 30;
    String name = "Pavan";
    final imageUrl =
        'https://media.licdn.com/dms/image/C4D03AQG21YypqinDkw/profile-displayphoto-shrink_800_800/0/1659019180848?e=2147483647&v=beta&t=u6gGJZAqv8Zs2aVIoaqiw1Rf60pSj7jNHdvvpo5AZu0';
    return Scaffold(
        // themeMode: ThemeMode.dark, // add dark theme
        // theme: ThemeData(primarySwatch: Colors.blue),
        // darkTheme: ThemeData(brightness: Brightness.dark),
        // debugShowCheckedModeBanner: false,
        appBar: AppBar(
          title: const Text(
            "Catlog App",
            style: TextStyle(color: Colors.black),
          ),
          // iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
            padding: const EdgeInsets.all(30),
            child:
                (CatelogModel.items != null && CatelogModel.items!.isNotEmpty)
                    ? ListView.builder(
                        itemCount: CatelogModel.items?.length,
                        itemBuilder: (context, index) {
                          return ItemWidget(item: CatelogModel.items![index]);
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )),
        drawer: const MyDrawer());
  }
}
