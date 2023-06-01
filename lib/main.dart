import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catlog/pages/add_cart.dart';
import 'package:flutter_catlog/pages/checkout_page.dart';
import 'package:flutter_catlog/pages/razorpay.dart';
import 'package:flutter_catlog/river_animation.dart';
import 'package:flutter_catlog/utils/routes.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/store.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/splash_page.dart';

void main() => {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.blue, // navigation bar color
        statusBarColor: Colors.pink, // status bar color
      )),
      runApp(VxState(store: MyStore(), child: const MyApp()))
    }; // initiate MyApp as  StatelessWidget

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
      theme: Mytheme.lightTheme(context),
      darkTheme: Mytheme.darkTheme(context), //we can toggle dark/light
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Splash(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.riverLogo: (context) => const LogoApp(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.cartRoute: (context) => const AddToCart(),
        MyRoutes.checkoutPage: (context) => const CheckoutAddressPage(),
        MyRoutes.razorpay: (context) => const MyHomePage(title: '',),
      },
    );
  }
}
