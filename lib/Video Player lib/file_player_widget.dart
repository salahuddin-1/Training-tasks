import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Video%20Player%20lib/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class FilePlayerWidget extends StatefulWidget {
  const FilePlayerWidget({Key? key}) : super(key: key);

  @override
  _FilePlayerWidgetState createState() => _FilePlayerWidgetState();
}

class _FilePlayerWidgetState extends State<FilePlayerWidget> {
  VideoPlayerController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Video"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller != null
                ? SizedBox(
                    height: 400,
                    child: VideoPlayerWidget(controller: controller!),
                  )
                : const SizedBox(
                    child: Text('No Video File Selected'),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: _button(),
            )
          ],
        ),
      ),
    );
  }

  FloatingActionButton _button() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        final file = await _pickVideoFile();

        if (file == null) return;

        controller = VideoPlayerController.file(file)
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((_) => controller!.play());
      },
    );
  }

  Future<File?> _pickVideoFile() async {
    final file = await FilePicker.platform.pickFiles(type: FileType.video);

    if (file == null) return null;

    return File(file.files.single.path!);
  }
}
