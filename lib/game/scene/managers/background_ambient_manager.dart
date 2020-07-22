import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class BackgroundAmbientManager {
  AudioCache _cache = AudioCache();
  AudioPlayer _player = AudioPlayer();

  void playAmbientBackground(String path) async {
    try {
      if (_player.state != AudioPlayerState.PLAYING) {
        _player = await _cache.loop(path);
        _player.setVolume(0.8);
      }
    } catch (e) {
      print(e);
    }
  }

  void pauseAmbientBackground() {
    try {
      if (_player?.state == AudioPlayerState.PLAYING) {
        _player.pause();
      }
    } catch (e) {
      print(e);
    }
  }

  void resumeAmbientBackground() {
    try {
      if (_player?.state == AudioPlayerState.PAUSED) {
        _player.resume();
      }
    } catch (e) {
      print(e);
    }
  }

  void stopAmbientBackground() {
    try {
      if (_player?.state == AudioPlayerState.PLAYING) {
        _player.stop();
        _cache.clearCache();
      }
    } catch (e) {
      print(e);
    }
  }
}
