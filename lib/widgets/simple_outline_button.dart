
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/widgets/text.dart';

class SimpleOutlineButton extends StatelessWidget {
  const SimpleOutlineButton(
      {super.key,
       this.color,
       this.child,
      required this.onTap,
      this.text,
      this.radius,
      this.width, this.height});
  final child;
  final VoidCallback onTap;
  final double? radius;
  final double? width;
  final Color? color;
  final String? text;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height??50,
          width: width,
          constraints: BoxConstraints(minWidth: width ?? Get.width / 2 - 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 25),
              border: Border.all(color: color??Theme.of(context).primaryColor)),
          alignment: Alignment.center,
          child: text == null
              ? child
              : EText(
                  text,
                  color: Colors.black,
                  weight: FontWeight.w700,
                ),),
    );
  }
}
