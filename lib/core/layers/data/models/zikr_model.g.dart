// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zikr_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZikrAdapter extends TypeAdapter<Zikr> {
  @override
  final int typeId = 0;

  @override
  Zikr read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Zikr(
      id: fields[0] as int,
      content: fields[1] as String,
      description: fields[3] as String?,
      title: fields[2] as String?,
      isCustomZikr: fields[4] as bool?,
      transliteration: fields[5] as String?,
      translation: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Zikr obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.isCustomZikr)
      ..writeByte(5)
      ..write(obj.transliteration)
      ..writeByte(6)
      ..write(obj.translation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZikrAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
