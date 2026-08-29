import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/constants/third_party_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareRewardRow extends StatelessWidget {
  const ShareRewardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SharePlus.instance.share(ShareParams(
          text: AppLocalizations.of(context).shareAppMessage(
            ThirdPartyValues.appLinkIOS,
            ThirdPartyValues.appLinkAndroid,
          ),
        ));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: ConstantValues.spacingMd),
        decoration: BoxDecoration(
          color: context.theme.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.share_outlined,
              color: context.theme.primaryColor,
            ),
            const SizedBox(width: 10),
            Text(
              AppLocalizations.of(context).shareReward,
              style: TextStyle(
                  color: context.theme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
