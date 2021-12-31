import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Video%20Player%20lib/video_player_widget.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';
import 'package:video_player/video_player.dart';

class NetworkPlayerWidget extends StatefulWidget {
  const NetworkPlayerWidget({Key? key}) : super(key: key);

  @override
  _NetworkPlayerWidgetState createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.network(networkURL)
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
        title: Text("Network Video"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: VideoPlayerWidget(controller: controller),
                ),
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      controller.value.isPlaying
                          ? controller.pause()
                          : controller.play();
                    },
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
              ],
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

final networkURL =
    "https://v19m.akamaized-sign.site/video/tos/useast2a/tos-useast2a-pve-0068/bd2a2049677b4e7b86753be6747e7cbb/?a=1988&br=6028&bt=3014&cd=0%7C0%7C1&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&expire=1637180725&ft=wUyFfF8rkag3-I&l=202111171425170102450241581E2CFD49&ls=354DBC2DDDE4FA68A1CC90FB084F96AC&li=6803201553965665542&lr=tiktok_m&mime_type=video_mp4&net=0&pl=0&policy=3&qs=0&rc=aml3NHZoaGp3czMzZzczM0ApNmZmZmloZDtpNzM1NzQ1Nmc1MWxeZzAuNGhfLS0uMTZzc2NeXi9fX18uMC4zMzReLS46Yw%3D%3D&signature=96d370cac031e7c57e99cf2c993c381a&tk=0&vl=&vr=";
