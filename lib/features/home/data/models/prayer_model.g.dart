// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerModelAdapter extends TypeAdapter<PrayerModel> {
  @override
  final int typeId = 4;

  @override
  PrayerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerModel(
      id: fields[0] as int,
      content: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PrayerModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
