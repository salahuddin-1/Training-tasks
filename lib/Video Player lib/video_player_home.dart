import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Video%20Player%20lib/asset_player_widget.dart';
import 'package:neosoft_training_tasks/Video%20Player%20lib/file_player_widget.dart';
import 'package:neosoft_training_tasks/Video%20Player%20lib/network_player_widget.dart';
import 'package:neosoft_training_tasks/src/resources/navigation.dart';

import 'Chewie Video Player/chewie_video_player.dart';

class VideoPlayerHome extends StatefulWidget {
  const VideoPlayerHome({Key? key}) : super(key: key);

  @override
  _VideoPlayerHomeState createState() => _VideoPlayerHomeState();
}

class _VideoPlayerHomeState extends State<VideoPlayerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player in Flutter"),
      ),
      body: Center(
        child: Container(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Play Video using : "),
              SizedBox(
                height: 30,
              ),
              SubmitButton(
                text: "Asset",
                onPressed: () {
                  Push(
                    context,
                    pushTo: AssetPlayerWidget(),
                  );
                },
              ),
              SubmitButton(
                text: "File",
                onPressed: () {
                  Push(
                    context,
                    pushTo: FilePlayerWidget(),
                  );
                },
              ),
              SubmitButton(
                text: "Network",
                onPressed: () {
                  Push(
                    context,
                    pushTo: NetworkPlayerWidget(),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text("Play Video using Chewie : "),
              SizedBox(
                height: 30,
              ),
              SubmitButton(
                text: "Go",
                onPressed: () {
                  Push(
                    context,
                    pushTo: ChewieVideoPlayer(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const SubmitButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: () {
        onPressed();
      },
    );
  }
}
