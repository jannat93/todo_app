import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Date_time extends ConsumerWidget {
  const Date_time({super.key, required this.onTap, required this.titleText, required this.valueText, required this.iconsection});
  final VoidCallback onTap;
  final String titleText;
  final String valueText;
  final IconData iconsection;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Material(
       child:
         Column(
           children: [
             Text(titleText),
             SizedBox(height: 5),
             Material(
               child: Ink(
                 decoration: BoxDecoration(
                   color: Colors.grey.shade200,
                   borderRadius: BorderRadius.circular(8)
                 ),
                 child: InkWell(
                   borderRadius: BorderRadius.circular(8),
                   onTap: ()=>onTap(),

                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.transparent,
                       borderRadius: BorderRadius.circular(8),
                     ),
                     height: 70,
                     width: 120,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(iconsection,
                         ),
                         SizedBox(width: 5),
                         Text(valueText),
                       ],
                     ),
                   ),
                 )
               ),
             ),
           ],
         ),
    );
  }
}
