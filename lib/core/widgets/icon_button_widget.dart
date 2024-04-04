import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  Icon icon;
  Function onPressed;
  Color color;
  CustomIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () => onPressed(), icon: icon, color: color);
  }
}
