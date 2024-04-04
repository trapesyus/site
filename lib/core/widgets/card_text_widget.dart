import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constants.dart';

// ignore: must_be_immutable
class CustomCardText extends StatelessWidget {
  CustomCardText(
      {super.key,
      required this.text,
      this.isContentColor = false,
      this.isBold = false,
      this.isItalic = false,
      this.isUnderline = false,
      this.overFlow = true,
      this.fontSize = 16});
  String text;
  bool overFlow;
  bool isUnderline;
  bool isItalic;
  bool isBold;
  bool isContentColor;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontFamily: GoogleFonts.merriweather().fontFamily,
            color: isContentColor ? ColorConstants.buttonColor : null,
            decoration: isUnderline ? TextDecoration.underline : null,
            fontWeight: isBold ? FontWeight.bold : null,
            fontStyle: isItalic ? FontStyle.italic : null,
            // fontFamily: TextFonts.fontChoice[Preferences.fontName],
            fontSize: fontSize),
        overflow: overFlow ? TextOverflow.ellipsis : null,
        maxLines: 2);
  }
}
