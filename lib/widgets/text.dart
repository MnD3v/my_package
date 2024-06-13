// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BigTitleText extends StatelessWidget {
  const BigTitleText(this.text, {super.key, this.color});
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return EText(
      text,
      weight: FontWeight.bold,
      size: 26,
      color: color,
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText(this.text, {super.key, this.color, this.align});
  final String text;
  final Color? color;
  final TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return EText(
      text,
      weight: FontWeight.bold,
      color: color,
      size: 22,
      align: align,
    );
  }
}

class EText extends StatelessWidget {
  const EText(this.text,
      {super.key,
      this.color,
      this.size,
      this.weight,
      this.align,
      this.font,
      this.maxLines,
      this.letterSpacing,
      this.underline,
      this.fontStyle,
      this.lineThrought});
  final String? text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? align;
  final String? font;
  final int? maxLines;
  final double? letterSpacing;
  final bool? underline;
  final bool? lineThrought;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
          letterSpacing: letterSpacing,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.bodySmall!.color,
          fontSize: size ?? 20.0,
          fontFamily: font??"Poppins",
          fontWeight: weight ?? FontWeight.normal,
          decorationColor: color,
          decoration: lineThrought == true
              ? TextDecoration.lineThrough
              : underline != true
                  ? TextDecoration.none
                  : TextDecoration.underline),
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines ?? 90,
      textScaleFactor: .7,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ETextRich extends StatelessWidget {
  const ETextRich({super.key, required this.textSpans});
  final List<InlineSpan> textSpans;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: textSpans),
      textScaleFactor: .7,
    );
  }
}

TextSpan ETextSpan(
    {required String text,
    Color? color,
    FontWeight? weight,
    double? size,
    bool? underline}) {
  return TextSpan(
      text: text,
      style: TextStyle(
          decorationColor: color,
          color: color,
          fontWeight: weight,
          fontSize: size ?? 20,
          decoration: underline == true ? TextDecoration.underline : null));
}
