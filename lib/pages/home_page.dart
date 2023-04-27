import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_catlog/pages/login_page.dart';

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
          child: Column(children: [
            Container(
              child: Text("Welcome to $days days of flutter by $name"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Text("Back Screen"))
          ]),
        ));
  }
}
