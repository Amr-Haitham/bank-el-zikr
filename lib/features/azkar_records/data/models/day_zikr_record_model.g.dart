// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_zikr_record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayZikrRecordAdapter extends TypeAdapter<DayZikrRecord> {
  @override
  final int typeId = 1;

  @override
  DayZikrRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayZikrRecord(
      id: fields[0] as String,
      dateTime: fields[1] as DateTime,
      azkarRecordById: (fields[2] as Map).cast<int, int>(),
    );
  }

  @override
  void write(BinaryWriter writer, DayZikrRecord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.azkarRecordById);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayZikrRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
