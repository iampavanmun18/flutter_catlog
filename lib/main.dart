import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/splash_page.dart';

void main() => runApp(const MyApp()); // initiate MyApp as  StatelessWidget

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // int days = 30;
    // String name = "Pavan";
    // double pi = 3.142;
    // bool isMale = true;
    // const pi_value = 3.14;
    // final pi_value_final = 3.142;
    return MaterialApp(
      themeMode: ThemeMode.light, // add dark theme
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryTextTheme: GoogleFonts.latoTextTheme()),
      // darkTheme:
      //     ThemeData(brightness: Brightness.light), //we can toggle dark/light
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Splash(),
        "/login": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
      },
    );
  }
}
