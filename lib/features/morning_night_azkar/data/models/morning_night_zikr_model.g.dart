// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'morning_night_zikr_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MorningNightZikrModelAdapter extends TypeAdapter<MorningNightZikrModel> {
  @override
  final int typeId = 3;

  @override
  MorningNightZikrModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MorningNightZikrModel(
      id: fields[0] as int,
      title: fields[1] as String?,
      content: fields[2] as String,
      count: fields[3] as int,
      favor: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MorningNightZikrModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.favor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MorningNightZikrModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
