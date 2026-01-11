import 'package:hive_flutter/hive_flutter.dart';

part 'version_model.g.dart';

@HiveType(typeId: 5)
class Version {
  @HiveField(0)
  final int currentVersion;

  Version({required this.currentVersion});
}
