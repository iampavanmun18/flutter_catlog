import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Pavan";
    return MaterialApp(
      themeMode: ThemeMode.dark, // add dark theme
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Text("Welcome to $days days of Flutter by $name"),
            ),
          ),
        ),
      ),
    );
  }
}
