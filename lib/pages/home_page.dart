import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_catlog/pages/drawer.dart';
import 'package:flutter_catlog/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        ),
        drawer: const MyDrawer());
  }
}
