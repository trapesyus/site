// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';

import '../constants/color_constants.dart';

class CustomTextFieldContactUsScreen extends StatelessWidget {
  String? hintText;
  String? suffixText;
  String? label;

  Function? isIconOnTap;
  bool isIconTap;
  bool isIcon;
  bool isItalic;
  bool labelStyle;
  bool fillColor;
  bool suffixStyle;
  bool hintTextStyle;
  bool passwordType;
  bool isBold;
  bool isUnderline;

  double fontSize;
  double sizeTop;
  double sizeBottom;
  double sizeLeft;
  double sizeRight;
  int inputFormatters;
  bool textAlignCenter;
  double verticalHeight;
  double horizontalHeight;

  TextEditingController? controller;

  CustomTextFieldContactUsScreen(
      {super.key,
      this.isIconTap = false,
      this.inputFormatters = 0,
      this.isIconOnTap,
      this.isIcon = false,
      this.isUnderline = false,
      this.fontSize = 16,
      this.isBold = false,
      this.isItalic = false,
      this.passwordType = false,
      this.controller,
      this.fillColor = false,
      this.hintText,
      this.hintTextStyle = false,
      this.suffixStyle = false,
      this.suffixText,
      this.label,
      this.labelStyle = false,
      this.sizeBottom = 0.016,
      this.sizeLeft = 0,
      this.sizeRight = 0,
      this.sizeTop = 0,
      this.textAlignCenter = false,
      this.verticalHeight = 0.05,
      this.horizontalHeight = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: context.getSizeHeight(size: sizeTop),
            bottom: context.getSizeHeight(size: sizeBottom),
            left: context.getSizeWidth(size: sizeLeft),
            right: context.getSizeWidth(size: sizeRight)),
        child: TextField(
          style: TextStyle(

              // color: Preferences.getThemeCheck()
              //     ? ColorConstants.blackColor
              //     : Colors.white,
              color: ColorConstants.whiteColor,
              // fontFamily: TextFonts.fontChoice[Preferences.fontName],
              fontSize: fontSize,
              decoration: isUnderline ? TextDecoration.underline : null,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500),
          scrollPhysics: const BouncingScrollPhysics(),
          textAlign: textAlignCenter ? TextAlign.center : TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          controller: controller,
          obscureText: passwordType ? true : false,
          // cursorColor: Preferences.getThemeCheck()
          //     ? ColorConstants.blueColor
          //     : ColorConstants.whiteColor,
          cursorColor: ColorConstants.orangeColor,
          maxLines: null, // satırın aşağıya devam etmesi için max lines = null,
          inputFormatters: inputFormatters != 0
              ? [LengthLimitingTextInputFormatter(inputFormatters)]
              : null,
          // onChanged: (value) async {
          //   if (isIconOnTap == null) return;
          //   await isIconOnTap!();
          //}, //Bu fonksiyon sadece arama ikonuna tıklandığında değil, genel olarak her metinde arama yapması için kullanılıyor.
          keyboardType: TextInputType.multiline,

          decoration: InputDecoration(
              suffixIcon: isIcon
                  ? IconButton(
                      onPressed: () => isIconOnTap!() ?? () {},
                      icon: const Icon(CupertinoIcons.search),
                      color: ColorConstants.greyColor,
                    )
                  : null,
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: ColorConstants.bgColor)),
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: ColorConstants.bgColor)),
              contentPadding: EdgeInsets.only(
                top: context.getSizeHeight(size: verticalHeight),
                left: context.getSizeWidth(size: horizontalHeight),
                right: context.getSizeWidth(size: horizontalHeight),
                bottom: context.getSizeHeight(size: verticalHeight),
              ),
              alignLabelWithHint: false,
              labelText: label ?? '',
              labelStyle: labelStyle
                  ? const TextStyle(
                      color: ColorConstants.whiteColor,
                      // fontFamily: TextFonts.fontChoice[Preferences.fontName]
                    )
                  : null,
              suffixText: suffixText ?? '',
              suffixStyle: const TextStyle(
                color: ColorConstants.whiteColor,
                // fontFamily: TextFonts.fontChoice[Preferences.fontName]
              ),
              hintStyle: hintTextStyle
                  ? const TextStyle(
                      color: ColorConstants.whiteColor,
                      // fontFamily: TextFonts.fontChoice[Preferences.fontName]
                    )
                  : null,
              hintText: hintText ?? '',
              fillColor: fillColor ? ColorConstants.whiteColor : null),
        ));
  }
}
