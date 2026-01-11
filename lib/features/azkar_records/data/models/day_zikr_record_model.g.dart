// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_zikr_record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayZikrRecordModelAdapter extends TypeAdapter<DayZikrRecordModel> {
  @override
  final int typeId = 1;

  @override
  DayZikrRecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayZikrRecordModel(
      id: fields[0] as String,
      dateTime: fields[1] as DateTime,
      azkarRecordById: (fields[2] as Map).cast<int, int>(),
    );
  }

  @override
  void write(BinaryWriter writer, DayZikrRecordModel obj) {
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
      other is DayZikrRecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
