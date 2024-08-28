import 'package:flutter/material.dart';
import '../../../core/consts/colors.dart';
class AddNewZikrButton extends StatefulWidget {
  const AddNewZikrButton({super.key});

  @override
  State<AddNewZikrButton> createState() => _AddNewZikrButtonState();
}

class _AddNewZikrButtonState extends State<AddNewZikrButton> {
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('addNewZikrScreen');
      },

      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        // backgroundColor: Theme.of(context).primaryColor,
        // foregroundColor: appWhite,
        //
        // onPressed: (){},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'إضافة ذكر',
                  style: TextStyle(
                    color: appWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.add,
                  color: appWhite,
                ),
              ]),
        ),),
    );
  }
}

