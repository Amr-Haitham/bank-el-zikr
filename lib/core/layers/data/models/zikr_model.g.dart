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
      category: fields[5] == null ? 'uncategorized' : fields[5] as String,
      count: fields[6] == null ? 1 : fields[6] as int,
      source: fields[7] as String?,
      contentTransliteration: fields[8] as String?,
      contentEn: fields[9] as String?,
      titleEn: fields[10] as String?,
      descriptionEn: fields[11] as String?,
      sourceEn: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Zikr obj) {
    writer
      ..writeByte(13)
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
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.count)
      ..writeByte(7)
      ..write(obj.source)
      ..writeByte(8)
      ..write(obj.contentTransliteration)
      ..writeByte(9)
      ..write(obj.contentEn)
      ..writeByte(10)
      ..write(obj.titleEn)
      ..writeByte(11)
      ..write(obj.descriptionEn)
      ..writeByte(12)
      ..write(obj.sourceEn);
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
