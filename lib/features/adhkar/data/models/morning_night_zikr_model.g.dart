// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'morning_night_zikr_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MorningOrNightZikrAdapter extends TypeAdapter<MorningOrNightZikr> {
  @override
  final int typeId = 3;

  @override
  MorningOrNightZikr read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MorningOrNightZikr(
      id: fields[0] as int,
      content: fields[2] as String,
      title: fields[1] as String?,
      count: fields[3] as int,
      favor: fields[4] as String?,
      source: fields[5] as String?,
      contentTransliteration: fields[6] as String?,
      contentEn: fields[7] as String?,
      titleEn: fields[8] as String?,
      favorEn: fields[9] as String?,
      sourceEn: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MorningOrNightZikr obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.favor)
      ..writeByte(5)
      ..write(obj.source)
      ..writeByte(6)
      ..write(obj.contentTransliteration)
      ..writeByte(7)
      ..write(obj.contentEn)
      ..writeByte(8)
      ..write(obj.titleEn)
      ..writeByte(9)
      ..write(obj.favorEn)
      ..writeByte(10)
      ..write(obj.sourceEn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MorningOrNightZikrAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
