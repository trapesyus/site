import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:wedding_organise/core/extensions/size_extension.dart';
import 'package:wedding_organise/core/widgets/appbar_with_tabbar_widget.dart';
import 'package:wedding_organise/core/widgets/text_widget.dart';

import '../../core/constants/color_constants.dart';

import '../albums_screen/albums_screen.dart';
import '../contact_us_screen/contact_us_screen.dart';
import '../home_screen/home_screen.dart';
import '../plan_screen/plan_screen.dart';
import '../services_screen/services_screen.dart';

// ignore: must_be_immutable
class TabBarScreen extends StatefulWidget {
  int startIndex;
  TabBarScreen({super.key, required this.startIndex});

  @override
  // ignore: library_private_types_in_public_api
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.startIndex;

    _tabController = TabController(
        length: 5,
        vsync: this); // 3 sekme için bir TabController oluşturuyoruz.
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose(); // TabController'ı bırakmayı unutmayın.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _selectedIndex,
      animationDuration: const Duration(milliseconds: 700),
      length: 5,
      child: Scaffold(
          floatingActionButton: _contactFloatingButton(),
          resizeToAvoidBottomInset: false,
          body: Observer(builder: (context) {
            return Stack(
              children: [
                Positioned(
                    top: context.getSizeHeight(size: 0.0),
                    width: context.getSizeWidth(size: 1),
                    bottom: context.getSizeHeight(size: 0),
                    child: _tabBarView()),
                Positioned(
                    height: context.getSizeHeight(size: 0.1),
                    right: 0,
                    left: 0,
                    child: _appBarAndTabBar(context)),
              ],
            );
          })),
    );
  }

  FloatingActionButton _contactFloatingButton() {
    return FloatingActionButton(
      elevation: 0,
      heroTag: 'contact',
      hoverColor: Colors.blue,
      isExtended: true,
      backgroundColor: ColorConstants.orangeColor,
      onPressed: () {},
      child: const Icon(CupertinoIcons.phone),
    );
  }

  AppBarWithTabBar _appBarAndTabBar(BuildContext context) {
    return AppBarWithTabBar(
      title: 'Eventopya',
      centerTitle: false,
      backgroundColor: Colors.transparent,
      tabController: _tabController,
      titleStyle: true,
      textFonts: const TextStyle(fontWeight: FontWeight.bold),
      actions: [_tabBar()],
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      controller: _tabController, // TabController'ı TabBarView'a veriyoruz.
      children: [
        HomeScreen(), //homeScreenEkle
        PlanScreen(),
        ServicesScreen(),
        AlbumsScreen(),
        ContactUsScreen(),
      ],
    );
  }

  TabBar _tabBar() {
    return TabBar(
      dividerColor: Colors.transparent,
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      labelColor: Colors.transparent,
      isScrollable: true,
      physics: const BouncingScrollPhysics(),
      indicatorColor: ColorConstants.orangeColor,
      controller: _tabController,
      tabs: [
        Tab(
            child: CustomText(
          text: 'Ana Sayfa',
          color: ColorConstants.whiteColor,
          isBold: false,
        )),
        Tab(
            child: FittedBox(
                fit: BoxFit.cover,
                child: CustomText(
                  text: 'Organizasyonlar',
                  color: ColorConstants.whiteColor,
                  isBold: false,
                ))),
        Tab(
            child: FittedBox(
          fit: BoxFit.cover,
          child: CustomText(
            text: 'Hizmetler',
            color: ColorConstants.whiteColor,
            isBold: false,
          ),
        )),
        Tab(
            child: FittedBox(
          fit: BoxFit.cover,
          child: CustomText(
            text: 'Albümler',
            color: ColorConstants.whiteColor,
            isBold: false,
          ),
        )),
        Tab(
            child: FittedBox(
          fit: BoxFit.cover,
          child: CustomText(
            text: 'Bize Ulaşın',
            color: ColorConstants.whiteColor,
            isBold: false,
          ),
        )),
      ],
    );
  }
}
