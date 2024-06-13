
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class Custom {
  
static void showDialog(Widget dialog) {
  FocusManager.instance.primaryFocus?.unfocus();
  Get.generalDialog(
    pageBuilder: (context, animation, secondaryAnimation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.translate(
              offset: Offset(
                  (1 - animation.value) * 100, (1 - animation.value) * 100),
              child: dialog);
        },
      );
    },
    barrierDismissible: true,
    barrierLabel: ""
  );
}

}