import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

openSongs({required String path}) {
  assetsAudioPlayer.open(
    Audio(path),
    autoStart: true,
    showNotification: true,
  );
}
