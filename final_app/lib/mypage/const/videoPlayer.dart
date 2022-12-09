import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../screen/const/my_indicator.dart';

class myVideo extends StatefulWidget {
  final file;
  const myVideo({
    required this.file,
    Key? key,
  }) : super(key: key);

  @override
  State<myVideo> createState() => _myVideoState();
}

class _myVideoState extends State<myVideo> {
  VideoPlayerController? controller;
  Future<void>? initializeVideoPlayerFuture;

  @override
  void initState() {
    //controller = VideoPlayerController.file(File('/data/user/0/com.example.final_app/cache/image_picker3641971445983601714.mp4'));
    controller = VideoPlayerController.file(widget.file);
    initializeVideoPlayerFuture = controller!.initialize();
    controller!.setLooping(true); //반복재생
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: controller!.value.aspectRatio,
                child: VideoPlayer(controller!),
              );
            } else {
              return Center(
                  child: Column(
                children: [
                  MyIndicator,
                  SizedBox(height: 8.0),
                  Text('동영상 로딩 중..',
                      style: TextStyle(fontSize: 18.0)),
                ],
              ));
            }
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (controller!.value.isPlaying) {
                controller!.pause();
              } else {
                controller!.play();
              }
            });
          },
          child: Icon(
            controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ],
    );
  }
}
