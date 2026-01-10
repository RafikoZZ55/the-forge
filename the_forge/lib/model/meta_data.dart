
import 'package:hive_flutter/hive_flutter.dart';

part 'meta_data.g.dart';

@HiveType(typeId: 3)
class MetaData {

@HiveField(0)
double themeMusicVolume;

@HiveField(1)
String themeMusicTrack;

@HiveField(2)
double soundEffectVolume;

@HiveField(3)
String soundEffectTrack;

@HiveField(4)
DateTime lastTimeLogged;

MetaData({
  required this.themeMusicVolume,
  required this.themeMusicTrack,
  required this.soundEffectVolume,
  required this.soundEffectTrack,
  required this.lastTimeLogged,
}) : assert(themeMusicVolume >= 0 && themeMusicVolume <= 1,"theme music volume isnt valid"),
     assert(soundEffectVolume >=0 && themeMusicVolume <= 1,"Sound effect volume isnt valid"); 


MetaData copyWith({
  double? themeMusicVolume,
  String? themeMusicTrack,
  double? soundEffectVolume,
  String? soundEffectTrack,
  DateTime? lastTimeLogged,
}) {
  return MetaData(
        themeMusicVolume: themeMusicVolume ?? 0.7, 
        themeMusicTrack: themeMusicTrack ?? 'assets/music/theme.mp3', 
        soundEffectVolume: soundEffectVolume ?? 0.7, 
        soundEffectTrack: soundEffectTrack ?? 'assets/music/anvil_sound.mp3', 
        lastTimeLogged: lastTimeLogged ?? DateTime.now()
      );
}
}