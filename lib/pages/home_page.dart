import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Pavan";
    return Scaffold(
      // themeMode: ThemeMode.dark, // add dark theme
      // theme: ThemeData(primarySwatch: Colors.blue),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      // debugShowCheckedModeBanner: false,
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Center(
        child:
            Container(child: Text("Welcome to $days days of flutter by $name")),
      ),
      drawer: Drawer(),
    );
  }
}
