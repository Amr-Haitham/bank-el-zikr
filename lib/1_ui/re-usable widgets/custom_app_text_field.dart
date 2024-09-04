import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppTextField extends StatelessWidget {
  final String title;

  final TextEditingController controller;
  final int? maxLines;
  final bool optional;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  const CustomAppTextField(
      {Key? key,
      required this.title,
      required this.controller,
      this.inputFormatters,
      this.maxLines,
      this.optional = false,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            textDirection: TextDirection.rtl,
            text: TextSpan(
              text: title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: optional
                  ? [
                      TextSpan(
                        text: ' (اختياري)',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize:
                                  12.0, // Adjust the size to your preference
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ]
                  : [],
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            textDirection: TextDirection.rtl,
            controller: controller,
          style: Theme.of(context).textTheme.bodySmall,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            textAlign: TextAlign.right,
          
            decoration: InputDecoration(
              hintText: title,
              
              // hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: appGray),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            maxLines: maxLines ?? 1,
          ),
        ],
      ),
    );
  }
}
