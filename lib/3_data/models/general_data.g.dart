// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeneralDataAdapter extends TypeAdapter<GeneralData> {
  @override
  final int typeId = 2;

  @override
  GeneralData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeneralData(
      currentZikrId:
          fields[0].runtimeType == String ? int.parse(fields[0]) : fields[0],
      currentCounter: fields[1] as int,
      currentGoal: fields[2] as int?,
      accountBalance: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GeneralData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.currentZikrId)
      ..writeByte(1)
      ..write(obj.currentCounter)
      ..writeByte(2)
      ..write(obj.currentGoal)
      ..writeByte(3)
      ..write(obj.accountBalance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeneralDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
