import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_contact_us_screen/admin_contact_us_screen_model/admin_contact_us_screen_model.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/padding_extension.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';
import 'package:wedding_organise/core/widgets/appbar_widget.dart';

import '../../core/constants/color_constants.dart';
import '../../core/enum/url_enum.dart';
import '../../core/widgets/elevated_button_widget.dart';
import '../../core/widgets/icon_button_widget.dart';
import '../../core/widgets/label_text_widget.dart';
import '../../core/widgets/progress_indicator.dart';
import '../../core/widgets/text_widget.dart';
import '../../core/widgets/textfield_widget.dart';
import '../../core/widgets/title_text_widget.dart';

class AdminContactUsScreen extends StatelessWidget {
  AdminContactUsScreen({super.key}) {
    reaction((_) async => await _adminContactUsScreenModel.initialize(), (_) {},
        name: 'contactUsScreen');
  }
  final AdminContactUsScreenModel _adminContactUsScreenModel =
      AdminContactUsScreenModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
            icon:
                const Icon(CupertinoIcons.back, color: ColorConstants.bgColor),
            onPressed: () =>
                AdminContactUsScreen().navigateToBack(context: context)),
        title: 'Bize Ulaşın Sayfası',
        centerTitle: false,
      ),
      body: SafeArea(
        child: Observer(builder: (_) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              _mainText(context)
                  .getPaddingOnly(context: context, top: 0.02, bottom: 0.02),
              _mainImage(context),
            ],
          );
        }),
      ),
    );
  }

  Padding _mainText(BuildContext context) {
    return _wordContainer(
        text: _adminContactUsScreenModel.contactScreenServiceModel.text ??
            _adminContactUsScreenModel.textLoadError,
        onPressed: () async => await _wordShowDialog(
            context: context,
            title: 'Ana Kısım Yazısı',
            oldWord:
                _adminContactUsScreenModel.contactScreenServiceModel.text ??
                    _adminContactUsScreenModel.textLoadError,
            onPressed: () async => await _adminContactUsScreenModel.updateText(
                link: UrlEnum.urlContactUsScreenImageText.url,
                updateWord:
                    _adminContactUsScreenModel.updateTextController.value.text,
                context: context)),
        context: context);
  }

  Padding _wordContainer(
      {required String text,
      required Function() onPressed,
      required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: const Border.fromBorderSide(
              BorderSide(color: ColorConstants.greenColor))),
      child: ListTile(
        title: CustomLabelText(
          label: text,
          isColorNotWhite: true,
        ),
        trailing: CustomIconButton(
            icon: const Icon(CupertinoIcons.pencil,
                color: ColorConstants.orangeColor),
            onPressed: onPressed),
      ),
    ).getPaddingOnly(context: context, right: 0.02);
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
        content: _adminContactUsScreenModel.isLoadingMainItems
            ? CustomLabelText(
                label: 'Güncel $title: $oldWord', isColorNotWhite: true)
            : const CustomCircularProgress(),
        actions: [
          Column(
            children: [
              CustomTextField(
                controller: _adminContactUsScreenModel.updateTextController,
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

  Container _mainImage(BuildContext context) {
    return _imagesContainer(
        content: '',
        isMainImage: true,
        text: _adminContactUsScreenModel.contactScreenServiceModel.text ??
            _adminContactUsScreenModel.textLoadError,
        context: context,
        title: 'Ana Resim',
        patchUrl: UrlEnum.urlContactUsScreenImageText.url,
        imageUrl: _adminContactUsScreenModel.contactScreenServiceModel.image ??
            _adminContactUsScreenModel.imageLoadError);
  }

  Container _imagesContainer(
      {required BuildContext context,
      required bool isMainImage,
      required String content,
      required String title,
      required String text,
      required String patchUrl,
      required String imageUrl}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          _adminContactUsScreenModel.isLoadingMainItems
              ? imageUrl.contains('https://')
                  ? Image.network(imageUrl,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          height: context.getSizeHeight(size: 0.8))
                      .getPaddingOnly(context: context, bottom: 0.02)
                  : Image.memory(
                      base64Decode(imageUrl),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      height: context.getSizeHeight(size: 0.8),
                    ).getPaddingOnly(context: context, bottom: 0.02)
              : const CustomCircularProgress()
                  .getPaddingOnly(context: context, bottom: 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () async => await _imageShowDialog(
                          content: content,
                          text: text,
                          patchUrl: patchUrl,
                          context: context,
                          title: title,
                          onPressed: () async =>
                              await _adminContactUsScreenModel
                                  .updateImageFromWebFolder(
                                context: context,
                              )),
                      child: CustomText(
                          text: 'Güncelle', color: ColorConstants.orangeColor)),
                  CustomIconButton(
                      icon: const Icon(
                        CupertinoIcons.pen,
                        color: ColorConstants.orangeColor,
                      ),
                      onPressed: () async => await _imageShowDialog(
                          content: content,
                          text: text,
                          patchUrl: patchUrl,
                          context: context,
                          title: title,
                          onPressed: () async =>
                              await _adminContactUsScreenModel
                                  .updateImageFromWebFolder(
                                context: context,
                              ))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> _imageShowDialog(
      {required BuildContext context,
      required String content,
      required String text,
      required String patchUrl,
      required String title,
      required Function() onPressed}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTitleText(title: title, color: ColorConstants.bgColor),
        actions: [
          Column(
            children: [
              CustomTextField(
                controller: _adminContactUsScreenModel.updateTextController,
                label: 'Eğer url ise buraya yapıştırın',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomElevatedButton(
                      buttonText: 'Dosya Seç', onPressed: onPressed)
                  .getPaddingOnly(
                      context: context,
                      bottom: 0.02,
                      left: 0.3,
                      right: 0.3,
                      top: 0.04),
              CustomElevatedButton(
                  buttonText: 'Gönder',
                  onPressed: () async => _adminContactUsScreenModel
                                  .updateTextController.value.text !=
                              '' &&
                          _adminContactUsScreenModel
                              .updateTextController.value.text
                              .contains('https://')
                      ? await _adminContactUsScreenModel.updateImageFromLink(
                          context: context,
                          link: _adminContactUsScreenModel
                              .updateTextController.value.text,
                        )
                      : _adminContactUsScreenModel.imageData != ''
                          ? await _adminContactUsScreenModel
                              .updateImageFromWebFolder(
                              context: context,
                            )
                          : null).getPaddingOnly(
                  context: context, left: 0.3, right: 0.3, bottom: 0.02),
              CustomElevatedButton(
                      buttonText: 'Vazgeç',
                      onPressed: () => Navigator.of(context).pop())
                  .getPaddingOnly(
                      context: context, left: 0.3, right: 0.3, bottom: 0.02),
            ],
          )
        ],
      ),
    );
  }
}
