// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/widgets/column.dart';
import 'package:my_widgets/extentions/extensions.dart';
import 'package:my_widgets/widgets/simple_button.dart';
import 'package:my_widgets/widgets/text.dart';

class EError extends StatelessWidget {
  const EError({super.key, this.error, this.retry, this.topPadding, this.icon});
  final icon;
  final String? error;
  final double? topPadding;
  final retry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: topPadding ?? 12),
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: EColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/icons/connection_off.png"),
              height: 80,
            ),
            12.h,
            const EText(
                /*  error ??  */ "Une erreur s'est produite, veuillez verifier votre connexion internet",
                maxLines: 10,
                align: TextAlign.center,
                size: 21,
                color: Colors.grey),
            18.h,
            SimpleButton(
              width: 242,
              height: 40,
              onTap: retry,
              smallHeight: true,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.sync, color: Colors.white),
                  EText(
                    "Touchez pour réessayer",
                    color: Colors.white,
                    weight: FontWeight.bold,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ECircularProgressIndicator extends StatelessWidget {
  const ECircularProgressIndicator(
      {super.key, this.label, this.color});
  final String? label;
  final color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image(
            //   image: AssetImage('assets/images/case.png'),
            //   height: 30,
            // ),
            SizedBox(
              width: 35,
              height: 35,
              child: CircularProgressIndicator(
                strokeWidth: 2.2,
                color:
                    color ?? Theme.of(context).primaryColor,
              ),
            ),

            label == null
                ? 0.h
                : Padding(
                    padding: const EdgeInsets.all(9),
                    child: EText(label, color: Theme.of(context).primaryColor),
                  )
          ],
        ),
      ),
    );
  }
}
