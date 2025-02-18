import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/radio_provider.dart';
class Radiolist extends ConsumerWidget {
  const Radiolist({super.key,
    required this.titleRadio,
    required this.categColor,
    required this.valueInput,
    required this.onChangeValue});

  final String titleRadio;
  final Color categColor;
  final int valueInput;
  final VoidCallback onChangeValue;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final radio =ref.watch(radioProvider);

    return Material(
      child: Theme(data: ThemeData(
        unselectedWidgetColor: categColor,
      ),
          child: RadioListTile(
            activeColor: categColor,
            contentPadding: EdgeInsets.zero,
              title: Transform.translate(offset: Offset(-22, 0),
              child: Text(titleRadio,style: TextStyle(fontWeight: FontWeight.w700,
              color: categColor),),),
              value: valueInput, groupValue: radio,
              onChanged: (value)=>onChangeValue(),
          )),
    );
  }
}
