import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.value.isInitialized) {
      return Container(
        alignment: Alignment.center,
        // height: 200,
        child: buildVideo(),
      );
    }
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
      ),
    );
  }

  Widget buildVideo() {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}
