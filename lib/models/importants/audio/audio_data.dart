import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_starterpack_jelly/utils/value.dart';
import 'package:flutter/foundation.dart';

class AudioData with ChangeNotifier {
  late AudioPlayer _audioPlayer;
  late AudioCache _audioCache;
  PlayerState _playerState = PlayerState.STOPPED;

  PlayerState get playerState {
    return _playerState;
  }

  Future<void> playPause(assetSound, isLocal) async {
    print('{$kDebugSound} playing $assetSound');
    if (_playerState == PlayerState.PLAYING) {
      print('{$kDebugSound}play from playing to pause');
      final playerResult = await _audioPlayer.pause();
      if (playerResult == 1) {
        // setState(() {
        _playerState = PlayerState.PAUSED;
        notifyListeners();
        // });
      }
    } else if (_playerState == PlayerState.PAUSED) {
      print('{$kDebugSound}play from paused to resume');
      final playerResult = await _audioPlayer.resume();
      if (playerResult == 1) {
        // setState(() {
        _playerState = PlayerState.PLAYING;
        notifyListeners();
        // });
      }
    } else if (_playerState == PlayerState.COMPLETED) {
      print('{$kDebugSound}play from completed');
      playPauseFirst(assetSound, isLocal);
    } else {
      print('{$kDebugSound}play from first/else');
      playPauseFirst(assetSound, isLocal);
    }
  }

  void playPauseFirst(assetSound, isLocal) async {
    if (isLocal == true) {
      _audioPlayer = await _audioCache.play(assetSound);
      // setState(() {
      _playerState = PlayerState.PLAYING;
      notifyListeners();
      // });
    } else {
      final playerResult =
          await _audioPlayer.play(assetSound, isLocal: isLocal);
      if (playerResult == 1) {
        // setState(() {
        _playerState = PlayerState.PLAYING;
        notifyListeners();
        // });
      }
    }
  }

  Future<void> stopAudio() async {
    final playerResult = await _audioPlayer.stop();
    if (playerResult == 1) {
      // setState(() {
      _playerState = PlayerState.STOPPED;
      notifyListeners();
      // });
    }
    print('{$kDebugSound}stop audio');
  }

  void initAudioConfiguration() {
    // audio
    _audioPlayer = AudioPlayer(
      mode: PlayerMode.MEDIA_PLAYER,
    ); // PlayerMode.LOW_LATENCYyou won't be able to handle seek or duration updates since this mode is crafted for very short audio files.
    _audioCache = AudioCache(fixedPlayer: _audioPlayer);
    // AudioPlayer.logEnabled = true;

    _audioPlayer.onPlayerError.listen((msg) {
      print('{$kDebugSound}audioPlayer error : $msg');
      // setState(() {
      _playerState = PlayerState.STOPPED;
      notifyListeners();
      // });
    });

    _audioPlayer.onPlayerCompletion.listen((event) async {
      print('{$kDebugSound}sound completed');
      stopAudio();
    });

    // TODO : for progressBar
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      // print('{$kDebugSound} Current duration: $p');
      // setState(() => position = p);
    });
    _audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      print('{$kDebugSound}Current player state: $s');
      if (s == PlayerState.PAUSED ||
          s == PlayerState.COMPLETED ||
          s == PlayerState.STOPPED) {
        // _animSoundController.stop();
      } else {
        // final start = 0.1;
        // final stop = 0.5;
        // _animSoundController.repeat(
        //   min: start,
        //   max: stop,
        //   reverse: true,
        //   period: _animSoundController.duration! * (stop - start),
        // );
      }
      // setState(() => _playerState = s);
    });

    if (kIsWeb) {
      // Calls to Platform.isIOS fails on web
      return;
    }
    if (Platform.isIOS) {
      _audioCache.fixedPlayer?.notificationService.startHeadlessService();
    }
  }
}
