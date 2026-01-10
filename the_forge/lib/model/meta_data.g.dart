// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MetaDataAdapter extends TypeAdapter<MetaData> {
  @override
  final int typeId = 3;

  @override
  MetaData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MetaData(
      themeMusicVolume: fields[0] as double,
      themeMusicTrack: fields[1] as String,
      soundEffectVolume: fields[2] as double,
      soundEffectTrack: fields[3] as String,
      lastTimeLogged: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MetaData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.themeMusicVolume)
      ..writeByte(1)
      ..write(obj.themeMusicTrack)
      ..writeByte(2)
      ..write(obj.soundEffectVolume)
      ..writeByte(3)
      ..write(obj.soundEffectTrack)
      ..writeByte(4)
      ..write(obj.lastTimeLogged);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
