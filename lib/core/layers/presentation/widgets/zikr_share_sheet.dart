import 'dart:typed_data';

import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/constants/third_party_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/zikr_share_card.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
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
          margin: const EdgeInsets.all(ConstantValues.spacingMd),
          padding:
              const EdgeInsets.symmetric(vertical: ConstantValues.spacingMd),
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
                  _shareAsText(context, content);
                },
              ),
              ListTile(
                leading: Icon(Icons.download_outlined,
                    color: context.colors.primary),
                title: Text(AppLocalizations.of(context).saveImage,
                    style: context.textTheme.bodyLarge),
                onTap: () {
                  final outerContext = Navigator.of(context).context;
                  Navigator.of(context).pop();
                  _saveImage(outerContext,
                      content: content, translation: translation);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _shareAsText(BuildContext context, String content) {
    final appMessage = AppLocalizations.of(context).shareAppMessage(
      ThirdPartyValues.appLinkIOS,
      ThirdPartyValues.appLinkAndroid,
    );
    SharePlus.instance.share(
      ShareParams(text: '$content\n\n$appMessage'),
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
