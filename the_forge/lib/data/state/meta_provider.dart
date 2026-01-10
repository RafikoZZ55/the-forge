

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_forge/model/meta_data.dart';

final metaProvider = StateNotifierProvider<MetaNotifier, MetaData>(
  (ref) {
    var box = Hive.box('metaBox');
    MetaData? meta = box.get('meta1');

    if(meta == null) {
      meta = MetaData(
        themeMusicVolume: 0.7, 
        themeMusicTrack: 'assets/music/theme.mp3', 
        soundEffectVolume: 0.7, 
        soundEffectTrack: 'assets/music/anvil_sound.mp3', 
        lastTimeLogged: DateTime.now()
      );
      box.put('meta1', meta);
    }
    return MetaNotifier(meta);
  }  
);


class MetaNotifier extends StateNotifier<MetaData> {
  MetaNotifier(super.state);

  void setThemeMusicVoulme(double volume) {
    state.themeMusicVolume = volume;
    
  }
}