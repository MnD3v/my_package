library blurry_container;

import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

class BlurryContainer extends StatelessWidget {
  /// The [child] will be shown over blurry container.
  final Widget child;

  /// [height] of blurry container.
  final double? height;

  /// [width] of blurry container.
  final double? width;

  /// [elevation] of blurry container.
  ///
  /// Defaults to `0`.
  final double elevation;

  /// The [blur] will control the amount of [sigmaX] and [sigmaY].
  ///
  /// Defaults to `5`.
  final double blur;

  /// [padding] adds the [EdgeInsetsGeometry] to given [child].
  ///
  /// Defaults to `const EdgeInsets.all(8)`.
  final EdgeInsetsGeometry padding;

  /// Background color of container.
  ///
  /// Defaults to `Colors.transparent`.
  ///
  /// The [color] you define will be shown at `0.5` opacity.
  final Color color;

  /// [borderRadius] of blurry container.
  final BorderRadius borderRadius;

  final BoxDecoration? decoration;

  const BlurryContainer({
    super.key,
    required this.child,
    this.decoration,
    this.height,
    this.width,
    this.blur = 5,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(.0),
    this.color = Colors.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(.0)),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      color: Colors.transparent,
      borderRadius: decoration!.borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            height: height,
            width: width,
            padding: padding,
            decoration: decoration,
            child: child,
          ),
        ),
      ),
    );
  }
}
