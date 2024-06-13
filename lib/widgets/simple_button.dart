// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/widgets/text.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {super.key,
      required this.onTap,
      this.width,
      this.text,
      this.child,
      this.color,
      this.padding,
      this.height,
      this.radius,
      this.smallHeight});
  final VoidCallback? onTap;
  final String? text;
  final Widget? child;
  final Color? color;
  final bool? smallHeight;
  final double? radius;
  final double? width;
  final double? padding;
  final double? height;
  @override
  Widget build(BuildContext context) {
    if (text == null && child == null) {
      throw Exception("child an text can't be null");
    }
    return Padding(
      padding: EdgeInsets.all(padding ?? .0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: height??50,
          constraints: BoxConstraints(minWidth: width ?? (Get.width / 2 - 20)),
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: (color ?? Theme.of(context).primaryColor),
              
              borderRadius: BorderRadius.circular(radius ?? 25)),
          child: text == null
              ? child
              : EText(
                  text,
                  color: Colors.white,
                  weight: FontWeight.w700,
                ),
        ),
      ),
    );
  }
}
