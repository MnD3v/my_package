import 'package:flutter/material.dart';
import 'package:my_widgets/extentions/extensions.dart';
import 'package:my_widgets/widgets/leading.dart';
import 'package:my_widgets/widgets/scaffold.dart';
import 'package:my_widgets/widgets/text.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EScaffold(
        appBar: AppBar(
          title: const TitleText(
            'Erreur',
           
          ),
          leading: const Leading(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              12.h,
              const Icon(Icons.info, size: 50, color: Colors.grey),
              12.h,
              const EText(
                "Quelque chose s'est mal passé, Quoi donc ? Laissez tomber, c'est pas tres important, le mal est déjà fait !",
                size: 20,
                color: Colors.grey,
                align: TextAlign.center,
                maxLines: 10,
              ),
            ],
          ),
        ));
  }
}
