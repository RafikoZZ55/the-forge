

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:the_forge/model/meta_data.dart';

final metaProvider = StateNotifierProvider<MetaNotifier, PlayerMetaData>(
  (ref) {
    final box = Hive.box<PlayerMetaData>('metaBox');
    PlayerMetaData? meta = box.get('meta1');

    if (meta == null) {
      meta = PlayerMetaData(
        themeMusicVolume: 0.7,
        themeMusicTrack: 'assets/music/theme.mp3',
        soundEffectVolume: 0.7,
        soundEffectTrack: 'assets/music/anvil_sound.mp3',
        lastTimeLogged: DateTime.now(),
      );
      box.put('meta1', meta);
    }
    return MetaNotifier(meta);
  },
);


class MetaNotifier extends StateNotifier<PlayerMetaData> {
  MetaNotifier(super.state);


  final AudioPlayer themePlayer = AudioPlayer();
  final AudioPlayer soundEffectPlayer = AudioPlayer();

  void setThemeMusicVolume(double volume) {
    state = state.copyWith(themeMusicVolume: volume);
    themePlayer.setVolume(volume);
    Hive.box('metaBox').put('meta1', state);
  }

  void setSoundEffectVolume(double volume) {
    state = state.copyWith(soundEffectVolume: volume);
    soundEffectPlayer.setVolume(volume);
    Hive.box('metaBox').put('meta1', state);
  }

  Future<void> initThemeMusic() async {
    await themePlayer.setAsset(state.themeMusicTrack);
    await themePlayer.setVolume(state.themeMusicVolume);
    themePlayer.setLoopMode(LoopMode.one);
    themePlayer.play();
  }

  void disposeThemeMusic() {
    themePlayer.dispose();
  }

  Future<void> initSoundEffect() async {
    await soundEffectPlayer.setAsset(state.soundEffectTrack);
    await soundEffectPlayer.setVolume(state.soundEffectVolume);
  }

  Future<void> playSoundEffect() async {
    if (soundEffectPlayer.playing) return;
    await soundEffectPlayer.play();
  }

}