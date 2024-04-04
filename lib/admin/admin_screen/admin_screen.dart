import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:wedding_organise/admin/admin_album_screen/admin_album_screen.dart';
import 'package:wedding_organise/admin/admin_contact_us_screen/admin_contact_us_screen.dart';
import 'package:wedding_organise/admin/admin_home_page_screen/admin_home_page_screen.dart';
import 'package:wedding_organise/admin/admin_plan_screen/admin_plan_screen.dart';
import 'package:wedding_organise/admin/admin_screen/admin_screen_model/admin_screen_model.dart';
import 'package:wedding_organise/admin/admin_services_screen/admin_services_screen.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/padding_extension.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';
import 'package:wedding_organise/core/widgets/icon_button_widget.dart';
import 'package:wedding_organise/core/widgets/label_text_widget.dart';
import 'package:wedding_organise/core/widgets/text_widget.dart';

import '../../core/widgets/elevated_button_widget.dart';
import '../../core/widgets/progress_indicator.dart';
import '../../core/widgets/textfield_widget.dart';
import '../../core/widgets/title_text_widget.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({super.key}) {
    reaction(
        (_) async =>
            await _adminScreenModel.initialize().whenComplete(() => null),
        (_) {});
  }
  final AdminScreenModel _adminScreenModel = AdminScreenModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Observer(
      builder: (context) => Scaffold(
        body: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: context.getSizeWidth(size: 0.2),
                  height: context.getSizeHeight(size: 1),
                  decoration: const BoxDecoration(
                      color: ColorConstants.orangeColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: ListView(
                    children: [
                      _listTile(
                              icon: const Icon(Icons.business),
                              label: 'Eventopya Admin Paneli',
                              onPressed: () {})
                          .getPaddingOnly(
                              context: context, bottom: 0.02, top: 0.04),
                      ExpansionTile(
                        title: CustomLabelText(label: 'Sayfalar'),
                        iconColor: ColorConstants.whiteColor,
                        collapsedIconColor: ColorConstants.whiteColor,
                        children: [
                          _listTile(
                              icon: const Icon(CupertinoIcons.home),
                              label: 'Ana Sayfa',
                              onPressed: () => AdminHomePageScreen()
                                  .navigateTo(context: context)),
                          _listTile(
                              icon: const Icon(CupertinoIcons.news),
                              label: 'Plan',
                              onPressed: () => AdminPlanScreen()
                                  .navigateTo(context: context)),
                          _listTile(
                              icon: const Icon(Icons.home_repair_service),
                              label: 'Hizmetler',
                              onPressed: () => AdminServicesScreen()
                                  .navigateTo(context: context)),
                          _listTile(
                              icon: const Icon(Icons.album),
                              label: 'Albümler',
                              onPressed: () => AdminAlbumScreen()
                                  .navigateTo(context: context)),
                          _listTile(
                              icon: const Icon(
                                  CupertinoIcons.phone_arrow_up_right),
                              label: 'Bize Ulaşın',
                              onPressed: () => AdminContactUsScreen()
                                  .navigateTo(context: context)),
                          _listTile(
                            icon: const Icon(CupertinoIcons.phone),
                            label: 'Telefon',
                            onPressed: () async => await _wordShowDialog(
                                context: context,
                                title: 'Telefon',
                                oldWord:
                                    _adminScreenModel.contactInfoModel.phone ??
                                        'Telefon Yüklenirken Bir Hata Oluştu',
                                onPressed: () async =>
                                    await _adminScreenModel.patchPhone(
                                        patchLink: _adminScreenModel
                                            .buttonPathController.value.text,
                                        context: context)),
                          ),
                          _listTile(
                            icon: const Icon(SimpleIcons.instagram),
                            label: 'Instagram',
                            onPressed: () async => await _wordShowDialog(
                                context: context,
                                title: 'Instagram',
                                oldWord: _adminScreenModel
                                        .contactInfoModel.instagram ??
                                    'Instagram Yüklenirken Bir Hata Oluştu',
                                onPressed: () async =>
                                    await _adminScreenModel.patchInstagram(
                                        patchLink: _adminScreenModel
                                            .buttonPathController.value.text,
                                        context: context)),
                          ),
                          _listTile(
                            icon: const Icon(SimpleIcons.x),
                            label: 'X',
                            onPressed: () async => await _wordShowDialog(
                                context: context,
                                title: 'X',
                                oldWord: _adminScreenModel.contactInfoModel.x ??
                                    'X Yüklenirken Bir Hata Oluştu',
                                onPressed: () async =>
                                    await _adminScreenModel.patchX(
                                        patchLink: _adminScreenModel
                                            .buttonPathController.value.text,
                                        context: context)),
                          ),
                          _listTile(
                              icon: const Icon(SimpleIcons.facebook),
                              label: 'Facebook',
                              onPressed: () async => await _wordShowDialog(
                                  context: context,
                                  title: 'Facebook',
                                  oldWord: _adminScreenModel
                                          .contactInfoModel.facebook ??
                                      'Facebook Yüklenirken Bir Hata Oluştu',
                                  onPressed: () async =>
                                      await _adminScreenModel.patchFacebook(
                                          patchLink: _adminScreenModel
                                              .buttonPathController.value.text,
                                          context: context))),
                          _listTile(
                            icon: const Icon(SimpleIcons.gmail),
                            label: 'Gmail',
                            onPressed: () async => await _wordShowDialog(
                                context: context,
                                title: 'Gmail',
                                oldWord:
                                    _adminScreenModel.contactInfoModel.mail ??
                                        'Gmail Yüklenirken Bir Hata Oluştu',
                                onPressed: () async =>
                                    await _adminScreenModel.patchMail(
                                        patchLink: _adminScreenModel
                                            .buttonPathController.value.text,
                                        context: context)),
                          ),
                          ExpansionTile(
                            title: CustomText(
                                text: 'Adres',
                                color: ColorConstants.whiteColor),
                            children: [
                              _listTile(
                                icon: const Icon(Icons.location_on_outlined),
                                label: 'Enlem',
                                onPressed: () async => await _wordShowDialog(
                                    context: context,
                                    title: 'Enlem',
                                    oldWord: _adminScreenModel
                                            .contactInfoModel.adress?.latitude
                                            .toString() ??
                                        'Enlem Yüklenirken Bir Hata Oluştu',
                                    onPressed: () {}),
                              ),
                              _listTile(
                                icon: const Icon(Icons.location_on_outlined),
                                label: 'Boylam',
                                onPressed: () async => await _wordShowDialog(
                                    context: context,
                                    title: 'Boylam',
                                    oldWord: _adminScreenModel
                                            .contactInfoModel.adress?.longtitude
                                            .toString() ??
                                        'Boylam Yüklenirken Bir Hata Oluştu',
                                    onPressed: () {}),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    width: context.getSizeWidth(size: 0.8),
                    height: context.getSizeHeight(size: 1),
                    color: ColorConstants.siteColor)
              ],
            ),
          ],
        ),
      ),
    ));
  }

  ListTile _listTile(
      {required Icon icon,
      required String label,
      required Function() onPressed}) {
    return ListTile(
        leading: CustomIconButton(
            icon: icon, color: ColorConstants.whiteColor, onPressed: onPressed),
        title: TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: onPressed,
            child: CustomLabelText(label: label, isColorNotWhite: false)));
  }

  Future<dynamic> _wordShowDialog(
      {required BuildContext context,
      required String title,
      required String oldWord,
      required Function() onPressed}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTitleText(title: title, color: ColorConstants.bgColor),
        content: _adminScreenModel.isWordLoading
            ? CustomLabelText(
                label: 'Güncel $title: $oldWord', isColorNotWhite: true)
            : const CustomCircularProgress(),
        actions: [
          Column(
            children: [
              CustomTextField(
                controller: _adminScreenModel.buttonPathController,
                label: 'Yeni $title Yazısı',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomElevatedButton(buttonText: 'Güncelle', onPressed: onPressed)
                  .getPaddingOnly(
                      context: context,
                      bottom: 0.02,
                      left: 0.3,
                      right: 0.3,
                      top: 0.04),
              CustomElevatedButton(
                      buttonText: 'Vazgeç',
                      onPressed: () => Navigator.of(context).pop())
                  .getPaddingOnly(
                      context: context, left: 0.3, right: 0.3, bottom: 0.02)
            ],
          )
        ],
      ),
    );
  }
}
