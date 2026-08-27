import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;

  void unfocus() {
    FocusScope.of(this).unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  SnackBar buildSnackBar(
    String message, {
    String? title,
    SnackBarType type = SnackBarType.success,
  }) {
    final color = switch (type) {
      SnackBarType.success => Colors.green,
      SnackBarType.error => Colors.red,
      SnackBarType.info => Colors.blue,
      SnackBarType.warning => Colors.orange,
    };

    final icon = switch (type) {
      SnackBarType.success => Icons.check_circle_rounded,
      SnackBarType.error => Icons.error_rounded,
      SnackBarType.info => Icons.info_rounded,
      SnackBarType.warning => Icons.warning_rounded,
    };

    return SnackBar(
      content: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                Text(
                  message,
                  style: TextStyle(color: Theme.of(this).colorScheme.onSurface),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(this).colorScheme.surface,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: Duration(
          milliseconds: (3000 + 100 * message.length).clamp(3000, 6000)),
    );
  }

  void showSnackBar(
    String message, {
    String? title,
    SnackBarType type = SnackBarType.success,
  }) {
    ScaffoldMessenger.of(this)
        .showSnackBar(buildSnackBar(message, title: title, type: type));
  }

  void showSuccessNotification({String? title, required String message}) {
    showSnackBar(message, title: title, type: SnackBarType.success);
  }

  void showErrorNotification({String? title, required String message}) {
    showSnackBar(message, title: title, type: SnackBarType.error);
  }

  void showWarningNotification({String? title, required String message}) {
    showSnackBar(message, title: title, type: SnackBarType.warning);
  }

  void showInfoNotification({String? title, required String message}) {
    showSnackBar(message, title: title, type: SnackBarType.info);
  }
}

enum SnackBarType { success, error, info, warning }
