import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';

class AppBarWithTabBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color backgroundColor;
  final bool titleStyle;
  final TextStyle? textFonts;
  final TabBar tabBar;
  final TabController?
      tabController; // TabController'ı null olarak belirtiyoruz.

  const AppBarWithTabBar({
    super.key,
    this.titleStyle = false,
    this.actions,
    this.centerTitle = false,
    this.leading,
    this.title,
    this.backgroundColor = Colors.transparent,
    this.textFonts,
    this.tabController, // TabController'ı null olarak belirtiyoruz.
    this.tabBar = const TabBar(
      tabs: [
        Tab(
          text: '',
          icon: null,
        ),
      ],
    ),
  });

  @override
  // ignore: library_private_types_in_public_api
  _AppBarWithTabBarState createState() => _AppBarWithTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _AppBarWithTabBarState extends State<AppBarWithTabBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.leading,
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      title: Text(
        widget.title ?? '',
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontFamily: GoogleFonts.merriweather().fontFamily,
            color: ColorConstants.whiteColor,
            fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis, // Başlığı kırpma
      ),
      centerTitle: widget.centerTitle,
      actions: widget.actions,
      // bottom: widget.tabBar,
    );
  }
}
