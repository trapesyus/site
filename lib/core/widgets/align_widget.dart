import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAlign extends StatelessWidget {
  CustomAlign(
      {super.key,
      required this.child,
      this.isCenter = false,
      this.isCenterLeft = false,
      this.isCenterRight = false,
      this.isBottomCenter = false,
      this.isBottomLeft = false,
      this.isBottomRight = false,
      this.isTopCenter = false,
      this.isTopLeft = false,
      this.isTopRight = false});
  Widget child;
  bool isCenter;
  bool isCenterLeft;
  bool isCenterRight;
  bool isBottomCenter;
  bool isBottomLeft;
  bool isBottomRight;
  bool isTopCenter;
  bool isTopLeft;
  bool isTopRight;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCenterLeft
          ? Alignment.centerLeft
          : isCenterRight
              ? Alignment.centerRight
              : isBottomCenter
                  ? Alignment.bottomCenter
                  : isBottomLeft
                      ? Alignment.bottomLeft
                      : isBottomRight
                          ? Alignment.bottomRight
                          : isTopCenter
                              ? Alignment.topCenter
                              : isTopLeft
                                  ? Alignment.topLeft
                                  : isTopRight
                                      ? Alignment.topRight
                                      : Alignment.center,
      child: child,
    );
  }
}
