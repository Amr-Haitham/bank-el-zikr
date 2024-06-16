// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zikr.dart';

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
      id: fields[0].runtimeType == String ? int.parse(fields[0]) : fields[0],
      content: fields[1] as String,
      description: fields[3] as String?,
      title: fields[2] as String?,
      isCustomZikr: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Zikr obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.isCustomZikr);
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
