import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_widgets/widgets/text.dart';

abstract class Toasts {
  static void error(context, {required String description, Color? color}) {
    Get.showSnackbar(GetSnackBar(
      borderRadius: 9,
      backgroundColor: Colors.red,
      icon: const Icon(Icons.info, color: Colors.white),
      titleText: const EText(
        "Erreur",
        size: 24,
        weight: FontWeight.bold,
        color: Colors.white,
      ),
      messageText: EText(
        description,
        color: Colors.white,
        maxLines: 4,
      ),
      snackPosition: SnackPosition.TOP,
      duration: 3.seconds,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 9),
    ));
  }

  static void success(context, {required String description, Color? color}) {
    Get.showSnackbar(GetSnackBar(
      borderRadius: 9,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      titleText: const EText(
        "Succès",
        size: 24,
        weight: FontWeight.bold,
        color: Colors.white,
      ),
      backgroundColor: Colors.green,
      messageText: EText(
        description,
        color: Colors.white,
        maxLines: 4,
      ),
      snackPosition: SnackPosition.TOP,
      duration: 3.seconds,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 9),
    ));
  }
}
