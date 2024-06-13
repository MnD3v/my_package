
import 'package:flutter/material.dart';

class EScaffold extends StatelessWidget {
  const EScaffold(
      {super.key,
      required this.body,
      this.appBar,
      this.floatingActionButton,
      this.color,
      this.bottomNavigationBar,
      this.floatingActionButtonLocation,
      this.drawer,
      this.keyy});
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Color? color;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Key? keyy;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: keyy,
        drawer: drawer,
        backgroundColor: color?? Theme.of(context).scaffoldBackgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
