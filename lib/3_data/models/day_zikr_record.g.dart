// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_zikr_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayZikrRecordAdapter extends TypeAdapter<DayZikrRecord> {
  Map<int, int> _convertToIntIntMap(Map<dynamic, dynamic> input) {
    Map<int, int> result = {};

    input.forEach((key, value) {
      // Convert keys and values to int if possible
      if (key is int && value is int) {
        result[key] = value;
      } else if (key is String && int.tryParse(key) != null && value is int) {
        result[int.parse(key)] = value;
      }
    });
    return result;
  }

  @override
  final int typeId = 1;

  @override
  DayZikrRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    ;
    return DayZikrRecord(
      id: fields[0] as String,
      dateTime: fields[1] as DateTime,
      azkarRecordById: _convertToIntIntMap(fields[2]),
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
