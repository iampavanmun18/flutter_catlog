import 'package:flutter/material.dart';
import 'package:flutter_catlog/Audio_Page/page3.dart';
import 'package:flutter_catlog/Audio_Page/page4.dart';
import 'package:flutter_catlog/cores/const.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFe5eefc),//maincolor
      appBar: AppBar(
        title: const Text('MEDIA PLAYER',
            style: TextStyle(color: Color(0XFF6f7e96),//stylecolor
            )
        ),
        backgroundColor: const Color(0XFFe5eefc),//maincolor
        centerTitle: true,
      ),
      body:
      Container(

        color: const Color(0XFFe5eefc),//maincolor

        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(50.0),

                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://miro.medium.com/max/1000/0*_KISko3_H_L7hZMj.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(180),
                  border: Border.all(
                    width:2,
                    color: AppColors.mainColor,
                  ),boxShadow: const [
                  BoxShadow(
                    color: AppColors.lightBlueShadow,
                    blurRadius: 10,
                    offset: Offset(5,5),
                    spreadRadius: 3,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5,
                    offset: Offset(-5,-5),
                    spreadRadius: 3,
                  )

                ],
                  gradient: const RadialGradient(
                      colors: [
                        AppColors.mainColor,
                        AppColors.mainColor,
                        AppColors.mainColor,
                        Colors.white,
                      ]
                  ),
                ),
                // margin: EdgeInsets.all(20),
                width: 300,
                height: 300,
                // color: Colors.blue,
                // child: Text('second'),
              ),


              Container(


                  color: const Color(0XFFd0ddf3),
                  width: 400,
                  height: 100,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      const Icon(
                        Icons.signal_cellular_connected_no_internet_4_bar,
                        size: 40.0,
                        color: Color(0XFF5880ff),
                      ),
                      const SizedBox(
                        width: 150.0,
                      ),
                      // margin: const EdgeInsets.all(10.0),
                      MaterialButton(
                        splashColor: const Color(0XAA92aeff),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500)),
                        height: 50,


                        color: const Color(0XFF92aeff),
                        child: const Text(
                          '         Offline           ',
                          style: TextStyle(
                            color: Color(0XFF6f7e96),
                            letterSpacing: 2.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LocalAudio()),//Page2
                          );
                          // Navigate to second route when tapped.
                        },
                      ),
                    ],
                  )),

              Container(


                  color: const Color(0XFFd0ddf3),
                  width: 400,
                  height: 100,
                  margin: const EdgeInsets.all(10.0),


                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      const Icon(
                        Icons.language,
                        size: 40.0,
                        color: Color(0XFF5880ff),
                      ),
                      const SizedBox(
                        width: 150.0,

                      ),
                      // margin: const EdgeInsets.all(10.0),
                      MaterialButton(
                        splashColor: const Color(0XAA92aeff),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500)),
                        height: 50,
                        color: const Color(0XFF92aeff),
                        child: const Text(
                          '          Online           ',
                          style: TextStyle(
                            color: Color(0XFF6f7e96),
                            letterSpacing: 2.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const OnlineAudio()),
                          );
                          // Navigate to second route when tapped.
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
