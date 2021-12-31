import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:neosoft_training_tasks/src/widgets/circular_progress.dart';

class PlayerButtons extends StatelessWidget {
  final AudioPlayer audioPlayer;

  const PlayerButtons({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<bool>(
          stream: audioPlayer.shuffleModeEnabledStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return circularProgress();

            return _shuffleButton(context, snapshot.data ?? false);
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (_, __) {
            return _previousButton();
          },
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (_, snapshot) {
            if (!snapshot.hasData) return circularProgress();

            final playerState = snapshot.data!;
            return _playPauseButton(playerState);
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (_, __) {
            return _nextButton();
          },
        ),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.ac_unit,
              color: Colors.transparent,
            ))
      ],
    );
  }

  Widget _shuffleButton(BuildContext context, bool isEnabled) {
    return IconButton(
      icon: isEnabled ? Icon(Icons.shuffle_on_outlined) : Icon(Icons.shuffle),
      onPressed: () async {
        final enable = !isEnabled;
        if (enable) {
          await audioPlayer.shuffle();
        }
        await audioPlayer.setShuffleModeEnabled(enable);
      },
    );
  }

  Widget _previousButton() {
    return IconButton(
      icon: Icon(Icons.skip_previous),
      onPressed: audioPlayer.hasPrevious ? audioPlayer.seekToPrevious : null,
    );
  }

  Widget _nextButton() {
    return IconButton(
      icon: Icon(Icons.skip_next),
      onPressed: audioPlayer.hasNext ? audioPlayer.seekToNext : null,
    );
  }

  Widget _playPauseButton(PlayerState playerState) {
    final processingState = playerState.processingState;

    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      // 1

      return circularProgress();
    } else if (!audioPlayer.playing) {
      // 2

      return IconButton(
        icon: Icon(Icons.play_arrow),
        iconSize: 64.0,
        onPressed: audioPlayer.play,
      );
    } else if (processingState != ProcessingState.completed) {
      // 3

      return IconButton(
        icon: Icon(Icons.pause),
        iconSize: 64.0,
        onPressed: audioPlayer.pause,
      );
    }

    // 4
    return IconButton(
      icon: Icon(Icons.replay),
      iconSize: 64.0,
      onPressed: () => audioPlayer.seek(
        Duration.zero,
        index: audioPlayer.effectiveIndices!.first,
      ),
    );
  }
}
