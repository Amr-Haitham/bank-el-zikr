// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_state_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CounterStateModelAdapter extends TypeAdapter<CounterStateModel> {
  @override
  final int typeId = 2;

  @override
  CounterStateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CounterStateModel(
      currentZikrId: fields[0] as int,
      currentCounter: fields[1] as int,
      currentGoal: fields[2] as int?,
      accountBalance: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CounterStateModel obj) {
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
      other is CounterStateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
