import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Leading extends StatelessWidget {
  const Leading({super.key, this.color});
  final color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: 45,
        width: 45,
        color: Colors.transparent,
        padding: const EdgeInsets.all(15),
        child: Icon(Icons.arrow_back, color: color??Colors.black),
      ),
    );
  }
}
