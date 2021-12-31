import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'video_player_widget.dart';

class AssetPlayerWidget extends StatefulWidget {
  const AssetPlayerWidget({Key? key}) : super(key: key);

  @override
  _AssetPlayerWidgetState createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  final asset = "assets/video_player_assets/luffy_vs_doffy.mp4";
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late bool isMuted = controller.value.volume == 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Asset Video"),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .5,
                child: Stack(
                  children: [
                    VideoPlayerWidget(controller: controller),
                    Positioned.fill(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          controller.value.isPlaying
                              ? controller.pause()
                              : controller.play();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .5,
                          child: Stack(
                            children: [
                              _buildPlay(),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: VideoProgressIndicator(
                                  controller,
                                  allowScrubbing: true,
                                  colors: VideoProgressColors(
                                    playedColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              IconButton(
                onPressed: () {
                  controller.setVolume(isMuted ? 1 : 0);
                },
                icon: Icon(
                  isMuted ? Icons.volume_mute : Icons.volume_down,
                  size: 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlay() {
    if (controller.value.isPlaying) {
      return SizedBox.shrink();
    }
    return Container(
      alignment: Alignment.center,
      color: Colors.black26,
      child: Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: 100,
      ),
    );
  }
}
