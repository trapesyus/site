import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/widgets/appbar_widget.dart';

import '../../screen/home_screen/home_screen.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
          title: 'Music',
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleStyle: true),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: const Icon(CupertinoIcons.home),
          onPressed: () =>
              const NavbarPage().navigateToPushReplacement(context: context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstants.bgColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Page 3',
          ),
        ],
        elevation: 0,
        currentIndex: _selectedIndex,
        selectedItemColor: ColorConstants.whiteColor,
        unselectedItemColor: ColorConstants.greyColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
