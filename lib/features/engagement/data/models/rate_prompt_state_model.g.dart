// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_prompt_state_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RatePromptStateAdapter extends TypeAdapter<RatePromptState> {
  @override
  final int typeId = 8;

  @override
  RatePromptState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatePromptState(
      lastShownAt: fields[0] as DateTime?,
      timesShown: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RatePromptState obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lastShownAt)
      ..writeByte(1)
      ..write(obj.timesShown);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatePromptStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
