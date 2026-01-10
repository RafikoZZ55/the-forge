
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final themeMusicProvider = StateNotifierProvider<ThemeMusicNotifier, AudioPlayer>(
  (ref) {
    final notifier = ThemeMusicNotifier();
    ref.onDispose(() => notifier.disposeTheme());
    return notifier;
  },
);

class ThemeMusicNotifier extends StateNotifier<AudioPlayer>{
  ThemeMusicNotifier() : super(AudioPlayer());

  void  initTheme() async {
    await state.setAsset("assets/music/theme.mp3");
    state.setLoopMode(LoopMode.one);
    state.play();
  }

  void disposeTheme() {
    state.dispose();
  }

  void setVolume({required double volume}){
    state.setVolume( volume / 100);
  }

}