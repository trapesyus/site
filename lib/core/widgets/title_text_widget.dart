import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTitleText extends StatelessWidget {
  CustomTitleText({super.key, required this.title, this.color = Colors.white});
  String title;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.merriweather().fontFamily),
    );
  }
}
