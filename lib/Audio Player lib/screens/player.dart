import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:neosoft_training_tasks/Audio%20Player%20lib/screens/commons/player_buttons.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    _audioPlayer = AudioPlayer();

    _audioPlayer
        .setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse(
              "asset:///assets/audio_player_assets/Giorno_theme.mp3",
            ),
          ),
          AudioSource.uri(
            Uri.parse(
              "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3",
            ),
          ),
          AudioSource.uri(
            Uri.parse(
              "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3",
            ),
          ),
          AudioSource.uri(
            Uri.parse(
              "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3",
            ),
          ),
        ],
      ),
    )
        .catchError((err) {
      // catch load errors: 404, invalid url ...
      print(err);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlayerButtons(audioPlayer: _audioPlayer),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
