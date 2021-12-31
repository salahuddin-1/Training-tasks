import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Video%20Player%20lib/Chewie%20Video%20Player/chewie_list_item.dart';
import 'package:video_player/video_player.dart';

import '../network_player_widget.dart';

class ChewieVideoPlayer extends StatefulWidget {
  const ChewieVideoPlayer({Key? key}) : super(key: key);

  @override
  _ChewieVideoPlayerState createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player using Chewie package'),
      ),
      body: ListView(
        children: [
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'assets/video_player_assets/luffy_vs_doffy.mp4',
            ),
            looping: true,
          ),
          Divider(),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'assets/video_player_assets/loading_constituion.mp4',
            ),
            looping: true,
          ),
          Divider(),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              "networkURL",
            ),
            looping: true,
          ),
        ],
      ),
    );
  }
}
