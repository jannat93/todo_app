import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField({super.key,
  required this.hintText, required this.maxLine, required this.txtController,

  });
  final String hintText;
  final int maxLine;
  final TextEditingController txtController;


  @override
  Widget build(BuildContext context) {
    return Container(
        margin:EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5)
        ),
        child: TextField(
          controller: txtController,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
            ),
            maxLines: maxLine,


        ),

    );
  }
}
