import 'package:flutter/services.dart';

class NoLeadingZeroInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty && newValue.text.startsWith('0')) {
      return oldValue;
    }
    return newValue;
  }
}

class WhitespaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty && newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
