
import 'package:flutter/material.dart';
import 'package:flutter_catlog/cores/const.dart';

typedef OnError = void Function(Exception exception);

class LocalAudio extends StatefulWidget {
  const LocalAudio({super.key});

  @override
  _LocalAudio createState() => _LocalAudio();
}

class _LocalAudio extends State<LocalAudio> {
  Duration _duration = const Duration();
  Duration _position = const Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  BoxDecoration mybox() {
    return BoxDecoration(border: Border.all(width: 2, color: Colors.red));
  }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  late String localFilePath;

  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                  'https://raw.githubusercontent.com/Pasupuleti-rajesh-babu/flutter_class/master/safari.jpg'),
              fit: BoxFit.cover,
            ),
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(180),
            border: Border.all(
              width: 2,
              color: AppColors.mainColor,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.lightBlueShadow,
                blurRadius: 10,
                offset: Offset(5, 5),
                spreadRadius: 3,
              ),
              BoxShadow(
                color: Colors.white,
                blurRadius: 5,
                offset: Offset(-5, -5),
                spreadRadius: 3,
              )
            ],
            gradient: const RadialGradient(colors: [
              AppColors.mainColor,
              AppColors.mainColor,
              AppColors.mainColor,
              Colors.white,
            ]),
          ),
          // margin: EdgeInsets.all(20),
          width: 300,
          height: 300,
          // color: Colors.blue,
          // child: Text('second'),
        ),
        Container(
          color: AppColors.mainColor,
          width: 850,
          height: 280,
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: children
                .map((w) =>
                    Container(padding: const EdgeInsets.all(6.0), child: w))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: SizedBox(
        width: 120,
        height: 45,
        child: ElevatedButton(onPressed: onPressed, child: Text(txt)),
      ),
    );
  }

  Widget slider() {
    return Container(
      // decoration: BoxDecoration(),
      padding: const EdgeInsets.all(6.0),
      color: AppColors.activeColor,
      width: double.infinity,

      child: Slider(
          activeColor: Colors.grey[600],
          inactiveColor: Colors.white,
          value: _position.inSeconds.toDouble(),
          min: 0.0,
          max: _duration.inSeconds.toDouble(),
          onChanged: (double value) {
            setState(() {
              seekToSecond(value.toInt());
              value = value;
            });
          }),
    );
  }

  Widget LocalAudio() {
    return _tab([
      slider(),
      _btn('Play', () => audioCache.play('Audio/Safari.mp3')),
      _btn('Pause', () => advancedPlayer.pause()),
      _btn('Stop', () => advancedPlayer.stop()),
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Safari",
            style: TextStyle(color: AppColors.styleColor),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.yellow,
            image: DecorationImage(
              image: AssetImage('assets/image/leo.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          // margin: EdgeInsets.all(10.0),
          // color: Colors.black,
          child: TabBarView(
            children: [
              LocalAudio(),
            ],
          ),
        ),
      ),
    );
  }
}
