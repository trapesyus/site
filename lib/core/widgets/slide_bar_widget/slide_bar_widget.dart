import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';
import 'package:wedding_organise/core/widgets/appbar_widget.dart';
import 'package:wedding_organise/core/widgets/icon_button_widget.dart';
import 'package:wedding_organise/core/widgets/label_text_widget.dart';
import 'package:wedding_organise/core/widgets/slide_bar_widget/slide_bar_widget_model/slide_bar_widget_model.dart';

import '../../../screen/albums_screen/albums_screen.dart';
import '../../../screen/contact_us_screen/contact_us_screen.dart';
import '../../../screen/home_screen/home_screen.dart';
import '../../../screen/plan_screen/plan_screen.dart';
import '../../../screen/services_screen/services_screen.dart';
import '../../constants/color_constants.dart';

class CustomSlideBarWidget extends StatelessWidget {
  final Widget body;
  final String title;
  CustomSlideBarWidget({super.key, required this.body, required this.title}) {
    reaction(
        (_) async => await _customSlideBarWidgetModel.initialize(), (_) {});
  }
  final CustomSlideBarWidgetModel _customSlideBarWidgetModel =
      CustomSlideBarWidgetModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: Drawer(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        width: context.getSizeWidth(size: 1),
                        height: context.getSizeHeight(size: 0.2),
                        child: Image.asset(
                            'assets/images/logo/wedding_logo.png',
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high)),
                    const Divider(
                      color: ColorConstants.bgColor,
                    ),
                    _drawerBody(context: context),
                  ],
                ),
              ),
            ),
            appBar: CustomAppBar(
              title: title,
              centerTitle: true,
              actions: [
                Container(
                  alignment: Alignment.centerRight,
                  width: context.getSizeWidth(size: 0.4),
                  height: context.getSizeHeight(size: 0.05),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        CustomIconButton(
                            icon: const Icon(CupertinoIcons.phone),
                            onPressed: () async =>
                                await _customSlideBarWidgetModel.getCall(
                                    context: context),
                            color: ColorConstants.bgColor),
                        CustomIconButton(
                            icon: const Icon(
                              SimpleIcons.whatsapp,
                            ),
                            onPressed: () async =>
                                await _customSlideBarWidgetModel.getWhatsapp(
                                    context: context),
                            color: ColorConstants.bgColor),
                        CustomIconButton(
                            icon: const Icon(
                              SimpleIcons.instagram,
                            ),
                            onPressed: () async =>
                                await _customSlideBarWidgetModel.getInstagram(),
                            color: ColorConstants.bgColor),
                        CustomIconButton(
                            icon: const Icon(
                              SimpleIcons.x,
                            ),
                            onPressed: () {},
                            color: ColorConstants.bgColor),
                        CustomIconButton(
                            icon: const Icon(
                              SimpleIcons.facebook,
                            ),
                            onPressed: () {},
                            color: ColorConstants.bgColor),
                        CustomIconButton(
                            icon: const Icon(
                              SimpleIcons.gmail,
                            ),
                            onPressed: () async =>
                                await _customSlideBarWidgetModel.getMail(),
                            color: ColorConstants.bgColor),
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: body));
  }

  Container _drawerBody({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.only(
        top: context.getSizeHeight(size: 0.02),
      ),
      child: Wrap(
        runSpacing: context.getSizeWidth(size: 0.02),
        children: [
          _drawerListTile(
              icon: const Icon(CupertinoIcons.home),
              context: context,
              label: 'Ana Sayfa',
              onTap: () => HomeScreen().navigateTo(context: context)),
          _drawerListTile(
              icon: const Icon(CupertinoIcons.briefcase_fill),
              context: context,
              label: 'Organizasyonlar',
              onTap: () => PlanScreen().navigateTo(context: context)),
          _drawerListTile(
              icon: const Icon(CupertinoIcons.gift),
              context: context,
              label: 'Hizmetler',
              onTap: () => ServicesScreen().navigateTo(context: context)),
          _drawerListTile(
              icon: const Icon(CupertinoIcons.photo),
              context: context,
              label: 'Albümler',
              onTap: () => AlbumsScreen().navigateTo(context: context)),
          _drawerListTile(
              icon: const Icon(CupertinoIcons.phone),
              context: context,
              label: 'İletişim',
              onTap: () => ContactUsScreen().navigateTo(context: context)),
        ],
      ),
    );
  }

  ListTile _drawerListTile(
      {required BuildContext context,
      required String label,
      required Icon icon,
      required Function() onTap}) {
    return ListTile(
      leading: icon,
      title: CustomLabelText(label: label, isColorNotWhite: true),
      onTap: onTap,
    );
  }
}
