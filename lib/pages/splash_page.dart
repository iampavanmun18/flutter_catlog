import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_catlog/pages/home_page_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePageGrid())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Opacity(
                  opacity: 0.5,
                  child: Image.asset("../../assets/images/Icon-192.png",
                      fit: BoxFit.contain)),
              Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Color(0xff7f00ff),
                highlightColor: Color(0xffe100ff),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset("../../assets/images/Icon-192.png",
                      fit: BoxFit.contain),
                  // child: Text(
                  //   "Vicon",
                  //   style: TextStyle(
                  //       fontSize: 90.0,
                  //       fontFamily: 'Pacifico',
                  //       shadows: <Shadow>[
                  //         Shadow(
                  //             blurRadius: 18.0,
                  //             color: Colors.black87,
                  //             offset: Offset.fromDirection(120, 12))
                  //       ]),
                  // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
