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
