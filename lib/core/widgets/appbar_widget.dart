import 'package:flutter/material.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color backgroundColor;
  final bool titleStyle;
  final TextStyle? textFonts;

  const CustomAppBar({
    super.key,
    this.titleStyle = false,
    this.actions,
    this.centerTitle = false,
    this.leading,
    this.title,
    this.backgroundColor = Colors.transparent,
    this.textFonts,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Text(
        title ?? '',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: ColorConstants.bgColor),
      ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
