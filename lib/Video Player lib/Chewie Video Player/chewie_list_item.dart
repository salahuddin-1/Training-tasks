// Do some settings for IOS
// in info.plist
// <key>NSAppTransportSecurity</key>
// 	<dict>
// 		<key>NSAllowsArbitraryLoads</key>
// 		<true/>
// 	</dict>

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
  late ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: widget.videoPlayerController.value.aspectRatio,
      looping: widget.looping,
      // Show the first frame of the video as preview image
      autoInitialize: true,
      // For having errors like Invalid URL
      errorBuilder: (context, errorMessage) {
        return _ErrorText(errorMessage: errorMessage);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }
}

class _ErrorText extends StatelessWidget {
  final String errorMessage;
  const _ErrorText({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
