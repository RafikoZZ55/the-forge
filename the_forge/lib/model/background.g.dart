// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BackgroundAdapter extends TypeAdapter<Background> {
  @override
  final int typeId = 1;

  @override
  Background read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Background(
      name: fields[0] as String, 
      background: fields[1] as String, 
      price: fields[2] as double
    );
  }

  @override
  void write(BinaryWriter writer, Background obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._name)
      ..writeByte(1)
      ..write(obj._background)
      ..writeByte(2)
      ..write(obj._price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
