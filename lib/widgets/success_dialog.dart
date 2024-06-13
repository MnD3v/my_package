import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/widgets/column.dart';
import 'package:my_widgets/extentions/extensions.dart';
import 'package:my_widgets/widgets/simple_button.dart';
import 'package:my_widgets/widgets/text.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, required this.body, });
  final String body;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: EColumn(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      28.h,
                      const EText('Succès', size: 25, weight: FontWeight.bold),
                      3.h,
                      EText(
                        body,
                        size: 21,
                        maxLines: 5,
                        align: TextAlign.center,
                      ),
                      SimpleButton(
                        onTap: () {
                          Get.back();
                        },
                        text: "OK",
                        color: Theme.of(context).primaryColor,
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Theme.of(context).scaffoldBackgroundColor),
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).textTheme.headlineSmall!.color),
                child: const Icon(Icons.check, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
