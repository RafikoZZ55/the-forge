
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final soundEffectProvider = StateNotifierProvider<SoundEffectNotifier, AudioPlayer>((ref) => SoundEffectNotifier());

class SoundEffectNotifier extends StateNotifier<AudioPlayer> {
  SoundEffectNotifier() : super(AudioPlayer());
  
  void playSoundEffect() async {
    if (state.playing) return;

     await state.setAsset("assets/music/anvil_sound.mp3");
    state.play();
  }

  void setVolume(double volume) {
    state.setVolume(volume / 100);
  }

}