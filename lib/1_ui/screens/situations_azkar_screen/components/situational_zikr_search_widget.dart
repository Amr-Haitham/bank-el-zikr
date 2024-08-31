import 'package:flutter/material.dart';

class SituationalZikrSearchWidget extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  const SituationalZikrSearchWidget({Key? key, required this.hintText,required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor),
        hintTextDirection: TextDirection.rtl,
        suffixIcon: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(Icons.search, color: Theme.of(context).primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}