import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_widgets/extentions/extensions.dart';

// ignore: must_be_immutable
class ETextField extends StatelessWidget {
  ETextField(
      {super.key,
      required this.onChanged,
      this.placeholder,
      this.onSubmitted,
      this.smallHeight,
      this.maxLength,
      this.number,
      this.pass,
      this.suffix,
      this.align,
      this.maxLines,
      this.minLines,
      this.initialValue,
      this.onTap,
      this.prefix,
      this.letterSapcing,
      this.radius,
      this.color,
      this.textColor,
      this.weight,
      this.placeholderColor,
      this.border,
      required this.phoneScallerFactor,
      this.textInputAction,
      this.separate,
      this.inputFormatter});
  double phoneScallerFactor;
  Color? textColor;
  double? radius;
  Function(String) onChanged;
  Function(String?)? onSubmitted;
  String? placeholder;
  bool? number;
  Color? color;
  int? maxLength;
  bool? pass;
  bool? smallHeight;
  Widget? suffix;
  TextAlign? align;
  int? maxLines;
  int? minLines;
  String? initialValue;
  VoidCallback? onTap;
  Widget? prefix;
  double? letterSapcing;
  bool? border;
  FontWeight? weight;
  int? separate;
  Color? placeholderColor;
  TextInputAction? textInputAction;

  final inputFormatter;
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(
        text: initialValue == "null" ? null : initialValue?.toString());
    return CupertinoTextField(
      readOnly: onTap == null ? false : true,
      onTap: onTap,
      controller: controller,
      obscureText: pass == true ? true : false,
      padding: EdgeInsets.symmetric(
        vertical: smallHeight == null ? 16 : 8,
        horizontal: 8,
      ),
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: pass == true ? 1 : maxLines,
      minLines: minLines,
      placeholder: placeholder,
      prefix: prefix,
      decoration: BoxDecoration(
          border: Border.all(
              color: border == false ? Colors.transparent : Colors.black38),
          color: color ?? Colors.white60,
          borderRadius: BorderRadius.circular(radius ?? 3)),
      placeholderStyle: TextStyle(
          color: placeholderColor ?? Colors.black38,
          fontWeight: FontWeight.normal,
          fontSize: 20 * .7 / phoneScallerFactor),
      keyboardType: pass == true
          ? TextInputType.text
          : number == null
              ? maxLines == null
                  ? TextInputType.text
                  : TextInputType.multiline
              : TextInputType.number,
      textAlign: align ?? TextAlign.start,
      style: TextStyle(
          letterSpacing: letterSapcing ?? .6,
          color: textColor ?? Theme.of(context).textTheme.bodySmall!.color,
          fontWeight: weight ?? FontWeight.w500,
          fontFamily: "Poppins",
          fontSize: 20 * .7 / phoneScallerFactor),
      suffix: suffix,
      textInputAction: textInputAction,
      inputFormatters: separate == null
          ? null
          : separate == 3
              ? [_ThousandsSeparatorInputFormatter(separate: 3)]
              : [_ThousandsSeparatorInputFormatter(separate: 2)],
    );
  }
}

class UnderLineTextField extends StatelessWidget {
  UnderLineTextField(
      {super.key,
      required this.onChanged,
      this.label,
      this.onSubmitted,
      this.smallHeight,
      this.maxLength,
      this.number,
      this.pass,
      this.suffix,
      this.align,
      this.maxLines,
      this.minLines,
      this.initialValue,
      this.onTap,
      this.prefix,
      this.letterSapcing,
      this.radius,
      this.color,
      this.textColor,
      this.weight,
      this.suffixText,
      this.border,
      this.separate,
      required this.phoneScallerFactor,
      this.inputFormatter});

  double phoneScallerFactor;
  Color? textColor;
  double? radius;
  Function(String) onChanged;
  Function(String?)? onSubmitted;
  String? label;
  bool? number;
  Color? color;
  int? maxLength;
  bool? pass;
  bool? smallHeight;
  Widget? suffix;
  TextAlign? align;
  int? maxLines;
  int? minLines;
  String? initialValue;
  VoidCallback? onTap;
  Widget? prefix;
  double? letterSapcing;
  bool? border;
  FontWeight? weight;
  String? suffixText;
  final inputFormatter;
  int? separate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: IsNullString(initialValue) ? null : initialValue,
      onChanged: onChanged,
      cursorColor: textColor,
      obscureText: pass == true ? true : false,
      maxLines: pass == true ? 1 : maxLines,
      keyboardType: pass == true
          ? TextInputType.text
          : number == null
              ? maxLines == null
                  ? TextInputType.text
                  : TextInputType.multiline
              : TextInputType.number,
      inputFormatters: separate == null
          ? null
          : separate == 3
              ? [_ThousandsSeparatorInputFormatter(separate: 3)]
              : [_ThousandsSeparatorInputFormatter(separate: 2)],
      decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: 22 * .7 / phoneScallerFactor, color: textColor),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color ?? Colors.black26)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color ?? Colors.black26)),
          suffix: suffix,
          prefix: prefix,
          suffixText: suffixText,
          suffixStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20 * .7 / phoneScallerFactor,
              color: textColor)),
      style: TextStyle(
          letterSpacing: letterSapcing ?? .6,
          color: textColor ?? Theme.of(context).textTheme.bodySmall!.color,
          fontWeight: weight ?? FontWeight.w500,
          fontFamily: "Poppins",
          fontSize: 20 * .7 / phoneScallerFactor),
    );
  }
}

class OutlineTextField extends StatelessWidget {
  OutlineTextField(
      {super.key,
      required this.onChanged,
      this.label,
      this.onSubmitted,
      this.smallHeight,
      this.maxLength,
      this.number,
      this.pass,
      this.suffix,
      this.align,
      this.maxLines,
      this.minLines,
      this.initialValue,
      this.onTap,
      this.prefix,
      this.letterSapcing,
      this.radius,
      this.color,
      this.textColor,
      this.weight,
      this.suffixText,
      this.border,
      this.separate,
      required this.phoneScallerFactor,
      this.inputFormatter});

  double phoneScallerFactor;
  Color? textColor;
  double? radius;
  Function(String) onChanged;
  Function(String?)? onSubmitted;
  String? label;
  bool? number;
  Color? color;
  int? maxLength;
  bool? pass;
  bool? smallHeight;
  Widget? suffix;
  TextAlign? align;
  int? maxLines;
  int? minLines;
  String? initialValue;
  VoidCallback? onTap;
  Widget? prefix;
  double? letterSapcing;
  bool? border;
  FontWeight? weight;
  String? suffixText;
  final inputFormatter;
  int? separate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: IsNullString(initialValue) ? null : initialValue,
      readOnly: onTap == null ? false : true,
      onTap: onTap,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
      cursorColor: textColor,
      obscureText: pass == true ? true : false,
      keyboardType: pass == true
          ? TextInputType.text
          : number == null
              ? maxLines == null
                  ? TextInputType.text
                  : TextInputType.multiline
              : TextInputType.number,
      inputFormatters: inputFormatter != null?inputFormatter: (separate == null
              ? null
              : separate == 3
                  ? [_ThousandsSeparatorInputFormatter(separate: 3)]
                  : [_ThousandsSeparatorInputFormatter(separate: 2)]),
      decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: 22 * .7 / phoneScallerFactor, color: textColor),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                  color: Colors.black26, style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(
                  color: Colors.black26, style: BorderStyle.solid)),
          suffix: suffix,
          prefix: prefix,
          suffixText: suffixText,
          suffixStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20 * .7 / phoneScallerFactor,
              color: textColor)),
      style: TextStyle(
          letterSpacing: letterSapcing ?? .6,
          color: textColor ?? Theme.of(context).textTheme.bodySmall!.color,
          fontWeight: weight ?? FontWeight.w500,
          fontFamily: "Poppins",
          fontSize: 20 * .7 / phoneScallerFactor),
    );
  }
}

class _ThousandsSeparatorInputFormatter extends TextInputFormatter {
  _ThousandsSeparatorInputFormatter({required this.separate});
  int separate;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove spaces and filter out invalid characters
    String newText = newValue.text.replaceAll(' ', '');
    newText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    // Format the number with spaces
    String formattedText = _formatNumber(newText);

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatNumber(String s) {
    return separate == 3
        ? s.replaceAllMapped(
            RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
            (Match match) => '${match.group(1)} ',
          )
        : s.replaceAllMapped(
            RegExp(r'(\d)(?=(\d{2})+(?!\d))'),
            (Match match) => '${match.group(1)} ',
          );
  }
}
