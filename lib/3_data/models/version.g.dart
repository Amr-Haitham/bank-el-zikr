// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VersionAdapter extends TypeAdapter<Version> {
  @override
  final int typeId = 5;

  @override
  Version read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Version(
      currentVersion: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Version obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.currentVersion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
