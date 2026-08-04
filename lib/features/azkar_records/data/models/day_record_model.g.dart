// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayRecordAdapter extends TypeAdapter<DayRecord> {
  @override
  final int typeId = 6;

  @override
  DayRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayRecord(
      id: fields[0] as String,
      date: fields[1] as DateTime,
      repsByZikrKey: (fields[2] as Map).cast<String, int>(),
      morningCompleted: fields[3] as bool,
      eveningCompleted: fields[4] as bool,
      sleepCompleted: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DayRecord obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.repsByZikrKey)
      ..writeByte(3)
      ..write(obj.morningCompleted)
      ..writeByte(4)
      ..write(obj.eveningCompleted)
      ..writeByte(5)
      ..write(obj.sleepCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
