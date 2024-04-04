import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.text,
      this.isMaxLines = false,
      this.maxLines = 1,
      this.isBold = false,
      this.isItalic = false,
      this.isUnderline = false,
      this.color = Colors.transparent,
      this.fontSize});
  int maxLines;
  bool isMaxLines;
  String text;
  Color color;
  double? fontSize;
  bool isUnderline;
  bool isItalic;
  bool isBold;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: isMaxLines ? maxLines : null,
      overflow: maxLines > 1 && isMaxLines ? TextOverflow.ellipsis : null,
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontStyle: isItalic ? FontStyle.italic : null,
          fontWeight: isBold ? FontWeight.bold : null,
          decoration: isUnderline ? TextDecoration.underline : null,
          fontFamily: GoogleFonts.merriweather().fontFamily,
          color: color,
          fontSize: fontSize),
    );
  }
}
