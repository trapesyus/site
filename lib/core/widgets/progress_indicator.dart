import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return _circularProgress();
  }

  Center _circularProgress() {
    return const Center(
        child: CircularProgressIndicator(color: ColorConstants.orangeColor));
  }
}
