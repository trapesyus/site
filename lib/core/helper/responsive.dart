import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1060 &&
      MediaQuery.of(context).size.width >= 610;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1060;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1060) {
          return desktop;
        } else if (constraints.maxWidth >= 610) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
