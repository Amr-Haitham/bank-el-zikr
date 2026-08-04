import 'dart:io';
import 'dart:typed_data';

import 'package:bank_el_ziker/core/constants/third_party_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/zikr_share_card.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ZikrShareSheet {
  static Future<void> show(
    BuildContext context, {
    required String content,
    String? translation,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Material(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.text_fields_rounded,
                    color: context.colors.primary),
                title: Text(AppLocalizations.of(context).shareAsText,
                    style: context.textTheme.bodyLarge),
                onTap: () {
                  Navigator.of(context).pop();
                  _shareAsText(content);
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.image_outlined, color: context.colors.primary),
                title: Text(AppLocalizations.of(context).shareAsImage,
                    style: context.textTheme.bodyLarge),
                onTap: () {
                  Navigator.of(context).pop();
                  _shareAsImage(context,
                      content: content, translation: translation);
                },
              ),
              ListTile(
                leading: Icon(Icons.download_outlined,
                    color: context.colors.primary),
                title: Text(AppLocalizations.of(context).saveImage,
                    style: context.textTheme.bodyLarge),
                onTap: () {
                  Navigator.of(context).pop();
                  _saveImage(context, content: content, translation: translation);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _shareAsText(String content) {
    SharePlus.instance.share(
      ShareParams(text: '$content\n\n${ThirdPartyValues.appLink}'),
    );
  }

  static Future<Uint8List> _renderImage(
    BuildContext context, {
    required String content,
    String? translation,
  }) {
    final appName = AppLocalizations.of(context).homeTitle;
    final controller = ScreenshotController();
    return controller.captureFromWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: ZikrShareCard(
          content: content,
          translation: translation,
          appName: appName,
        ),
      ),
      pixelRatio: 3,
    );
  }

  static Future<void> _shareAsImage(
    BuildContext context, {
    required String content,
    String? translation,
  }) async {
    final bytes =
        await _renderImage(context, content: content, translation: translation);

    final tempDir = await getTemporaryDirectory();
    final file = File(
        '${tempDir.path}/zikr_share_${DateTime.now().microsecondsSinceEpoch}.png');
    await file.writeAsBytes(bytes);

    await SharePlus.instance.share(
      ShareParams(files: [XFile(file.path)]),
    );
  }

  static Future<void> _saveImage(
    BuildContext context, {
    required String content,
    String? translation,
  }) async {
    final bytes =
        await _renderImage(context, content: content, translation: translation);
    try {
      await Gal.putImageBytes(bytes);
      if (context.mounted) {
        context.showSuccessNotification(
          message: AppLocalizations.of(context).imageSaved,
        );
      }
    } on GalException catch (e) {
      if (context.mounted) {
        context.showErrorNotification(
          message: e.type.message,
        );
      }
    }
  }
}
