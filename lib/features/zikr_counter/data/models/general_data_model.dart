import 'package:hive/hive.dart';
part 'general_data_model.g.dart';

@HiveType(typeId: 2)
class GeneralData extends HiveObject {
  GeneralData({
    required this.currentZikrKey,
    required this.currentCounter,
    required this.currentGoal,
    required this.accountBalance,
  });
  @HiveField(0)
  String currentZikrKey;
  @HiveField(1)
  int currentCounter;
  @HiveField(2)
  int? currentGoal;
  @HiveField(3)
  int accountBalance;
}

// Field 0 held an int zikr id before it became a String zikrKey, so the
// generated adapter's `fields[0] as String` throws on pre-v11 data and
// openAndGetBox then deletes the box, losing the user's balance. Registered
// in place of GeneralDataAdapter to read those rows instead; the id can't be
// resolved to a key here, so migration repoints it afterwards.
class LegacyTolerantGeneralDataAdapter extends TypeAdapter<GeneralData> {
  @override
  final int typeId = 2;

  @override
  GeneralData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    final rawKey = fields[0];
    return GeneralData(
      currentZikrKey: rawKey is String ? rawKey : '',
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
      ..write(obj.currentZikrKey)
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
      other is LegacyTolerantGeneralDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
