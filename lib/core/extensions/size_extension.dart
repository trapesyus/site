import 'package:flutter/material.dart';

extension GetSizeHeight on BuildContext {
  double getSizeHeight({required double size}) =>
      MediaQuery.of(this).size.height * size;
}

extension GetSizeWidth on BuildContext {
  double getSizeWidth({required double size}) =>
      MediaQuery.of(this).size.width * size;
}
