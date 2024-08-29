import 'package:flutter/material.dart';

class CustomAppTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final int? maxLines;
  final bool optional;

  const CustomAppTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.maxLines,
    this.optional = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            optional ? '$title اختياري' : title,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          TextField(
            textDirection: TextDirection.rtl,
            controller: controller,
            decoration: InputDecoration(
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
