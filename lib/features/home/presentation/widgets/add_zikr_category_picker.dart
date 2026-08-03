import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/initial_data.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class AddZikrCategoryPicker extends StatelessWidget {
  const AddZikrCategoryPicker({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddZikrCategoryPicker(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';

    return Container(
      margin: const EdgeInsets.all(12),
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.chooseAdhkarCategory,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (final category in InitialData.categories)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: category.color.withValues(alpha: 0.15),
                      child: Icon(category.icon, color: category.color),
                    ),
                    title: Text(category.displayTitle(isEnglish),
                        style: context.textTheme.bodyLarge),
                    onTap: () {
                      Navigator.of(context).pop();
                      AutoRouter.of(context).push(ZikrCategoryRoute(
                        category: category.key,
                        title: category.displayTitle(isEnglish),
                      ));
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
