import 'package:flutter/material.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';

class PopupFunctions {
  static void deleteZikrDialog(
      {required BuildContext context,
      required String content,
      required Function() onDelete}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: ConstantValues.appHorizontalPadding,
          ),
          child: SizedBox(
            width: double.infinity,
            height: 152, // 1/5th of the screen height, adjust as needed
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        content,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        // Handle "حذف" button press
                        Navigator.pop(context);
                        onDelete();
                      },
                      child: Text(
                        'حذف',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: appRed,
                            ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle "الغاء" button press
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'الغاء',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
