import 'package:flutter/material.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';

extension GetPadding on Widget {
  Padding getPadding(
          {required BuildContext context,
          required double sizeWidth,
          required double sizeHeight}) =>
      Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.getSizeWidth(size: sizeWidth),
              vertical: context.getSizeHeight(size: sizeHeight)),
          child: this);
}

extension GetPaddingOnly on Widget {
  Padding getPaddingOnly(
          {required BuildContext context,
          double? left,
          double? right,
          double? top,
          double? bottom}) =>
      Padding(
          padding: EdgeInsets.only(
              right: context.getSizeWidth(size: right ?? 0),
              left: context.getSizeWidth(size: left ?? 0),
              bottom: context.getSizeHeight(size: bottom ?? 0),
              top: context.getSizeHeight(size: top ?? 0)),
          child: this);
}
