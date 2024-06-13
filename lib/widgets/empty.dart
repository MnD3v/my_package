import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/widgets/column.dart';
import 'package:my_widgets/extentions/extensions.dart';
import 'package:my_widgets/widgets/text.dart';


class Vide extends StatelessWidget {
  const Vide({super.key, required this.message, this.topPadding, this.height, this.icon});
  final String message;
  final double? topPadding;
  final double? height;
  final icon;
  @override
  Widget build(BuildContext context) {
    return 
       Column(
         children: [
           SizedBox(
            width: Get.width,
                 
            child: EColumn(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (topPadding ?? 24).h,
               icon??  const Icon(Icons.all_inbox, color: Colors.grey, size: 50),
               12.h,
                EText(message, color: Colors.grey),
             
                
             
               
              ],
            ),
                 
               ),
         ],
       );
  }
}
