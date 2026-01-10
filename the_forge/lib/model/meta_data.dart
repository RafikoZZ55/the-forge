
import 'package:hive_flutter/hive_flutter.dart';

part 'meta_data.g.dart';

@HiveType(typeId: 3)
class PlayerMetaData {

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

PlayerMetaData({
  required this.themeMusicVolume,
  required this.themeMusicTrack,
  required this.soundEffectVolume,
  required this.soundEffectTrack,
  required this.lastTimeLogged,
}) : assert(themeMusicVolume >= 0 && themeMusicVolume <= 1, "theme music volume isnt valid"),
     assert(soundEffectVolume >= 0 && soundEffectVolume <= 1, "sound effect volume isnt valid"); 


PlayerMetaData copyWith({
  double? themeMusicVolume,
  String? themeMusicTrack,
  double? soundEffectVolume,
  String? soundEffectTrack,
  DateTime? lastTimeLogged,
}) {
  return PlayerMetaData(
        themeMusicVolume: themeMusicVolume ?? this.themeMusicVolume,
        themeMusicTrack: themeMusicTrack ?? this.themeMusicTrack,
        soundEffectVolume: soundEffectVolume ?? this.soundEffectVolume,
        soundEffectTrack: soundEffectTrack ?? this.soundEffectTrack,
        lastTimeLogged: lastTimeLogged ?? this.lastTimeLogged,
      );
}
}