import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';

class CustomLottieSplashView extends StatelessWidget {
  const CustomLottieSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
          alignment: Alignment.center,
          width: context.getSizeWidth(size: 1),
          height: context.getSizeHeight(size: 1),
          decoration: const BoxDecoration(color: ColorConstants.siteColor),
          child: Lottie.asset('assets/lottie/initialize.json',
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              width: context.getSizeWidth(size: 0.2),
              height: context.getSizeHeight(size: 0.2))),
    );
  }
}
