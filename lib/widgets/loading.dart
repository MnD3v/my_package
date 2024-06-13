import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/extentions/extensions.dart';
import 'package:my_widgets/widgets/text.dart';

void loading({progress, final color, final backgroundColor}) {
  Get.dialog(
      Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Loading(backgroundColor: backgroundColor, color: color),
      ),
      transitionDuration: 333.milliseconds,
      transitionCurve: Curves.slowMiddle,
      barrierDismissible: false,
      barrierColor: Colors.black26);
}

class Loading extends StatelessWidget {
  const Loading(
      {super.key,
      this.progress,
      required this.backgroundColor,
      required this.color});
  final Widget? progress;
  final color;
  final backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 155.0,
        decoration: const BoxDecoration(color: Colors.transparent),
        alignment: Alignment.center,
        child: Container(
          height: 70.0,
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: Colors.white30, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  //            Image(image: AssetImage('assets/images/case.png'), height: 30,),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Stack(
                      children: [
                        CircularProgressIndicator(
                          color: color ??
                              Theme.of(context).primaryColor,
                          strokeWidth: 2.2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              12.w,
              EText('Chargement en cours...',
                  maxLines: 2,
                  weight: FontWeight.w500,
                  align: TextAlign.center,
                  color: color ?? Theme.of(context).primaryColor)
            ],
          ),
        ));
  }
}
