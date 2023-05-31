// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catlog/cores/const.dart';
import 'package:video_player/video_player.dart';

class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEDIA PLAYER',
            style: TextStyle(
              color: Color(0XFF6f7e96), //stylecolor
            )),
        backgroundColor: const Color(0XFFe5eefc), //maincolor
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.mainColor,
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                ChewieListItem(
                  videoPlayerController: VideoPlayerController.asset(
                    'assets/Video/Captain_Jack.mp4',
                  ),
                  looping: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  const ChewieListItem({
    Key? key,
    required this.videoPlayerController,
    required this.looping,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
