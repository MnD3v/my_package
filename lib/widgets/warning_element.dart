import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/extentions/extensions.dart';

import 'text.dart';

class WarningElement extends StatelessWidget {
  const WarningElement({super.key, required this.label,});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Icon(Icons.circle, color: Theme.of(context).primaryColor, size: 9),
            6.w,
            SizedBox(width: Get.width - 150,child: EText(label, maxLines: 3,))
          ],
        ),
      ),
    );
  }
}