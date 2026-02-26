extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
}

extension NullStringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
