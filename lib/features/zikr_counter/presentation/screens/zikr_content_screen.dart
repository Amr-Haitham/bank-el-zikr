import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:flutter/material.dart';

class ZikrContentScreen extends StatelessWidget {
  final ZikrEntity zikr;
  const ZikrContentScreen({super.key, required this.zikr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: ConstantValues.appTopPadding,
              right: ConstantValues.appHorizontalPadding,
              left: ConstantValues.appHorizontalPadding),
          child: Column(
            children: [
              TitleWithBackButton(
                title: zikr.title ?? "",
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          zikr.content,
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineSmall!
                              .copyWith(color: context.theme.primaryColor),
                        ),
                        if (zikr.description != null &&
                            zikr.description!.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 50,
                                horizontal: ConstantValues.spacingLg),
                            child: Divider(
                              color: context.textTheme.bodySmall!.color,
                              thickness: 1,
                            ),
                          ),
                          Text(
                            zikr.description!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
