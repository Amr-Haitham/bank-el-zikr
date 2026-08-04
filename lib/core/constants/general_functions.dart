import 'dart:math';

String dateIdGenerator(DateTime dateTime) {
  return "${dateTime.year.toString().padLeft(4, '0')}-"
      "${dateTime.month.toString().padLeft(2, '0')}-"
      "${dateTime.day.toString().padLeft(2, '0')}";
}

String generateCustomZikrKey() {
  final random = Random();
  final randomSuffix = List.generate(6, (_) => random.nextInt(36))
      .map((n) => n.toRadixString(36))
      .join();
  return 'custom_${DateTime.now().microsecondsSinceEpoch}_$randomSuffix';
}
