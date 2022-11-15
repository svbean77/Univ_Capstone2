/*
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final images;
  const Video({
    required this.images,
    Key? key,
  }) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  initializeController() async {
    final controller = VideoPlayerController.network(widget.images);

    await controller.initialize();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [
        AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
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
        )
      ],
    );
  }
}
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
    controller = VideoPlayerController.file(File(widget.file));
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
              return Center(child: CircularProgressIndicator());
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
