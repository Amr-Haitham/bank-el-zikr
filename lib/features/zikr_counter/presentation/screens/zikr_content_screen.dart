import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:flutter/material.dart';

class ZikrContentScreen extends StatelessWidget {
  final ZikrEntity zikr;
  const ZikrContentScreen({super.key, required this.zikr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                        if (zikr.description != null &&
                            zikr.description!.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 50, horizontal: 16),
                            child: Divider(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
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
