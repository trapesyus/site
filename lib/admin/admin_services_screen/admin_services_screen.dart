import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_services_screen/admin_services_screen_model/admin_services_screen_model.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/core/extensions/padding_extension.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';
import 'package:wedding_organise/core/widgets/appbar_widget.dart';
import 'package:wedding_organise/core/widgets/progress_indicator.dart';
import 'package:wedding_organise/core/widgets/text_widget.dart';
import 'package:wedding_organise/core/widgets/title_text_widget.dart';

import '../../core/widgets/elevated_button_widget.dart';
import '../../core/widgets/icon_button_widget.dart';
import '../../core/widgets/label_text_widget.dart';
import '../../core/widgets/textfield_widget.dart';

class AdminServicesScreen extends StatelessWidget {
  AdminServicesScreen({super.key}) {
    reaction((_) async => await _adminServciesScreenModel.initialize(), (_) {},
        name: 'adminScreen');
  }
  final AdminServicesScreenModel _adminServciesScreenModel =
      AdminServicesScreenModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _addPostButton(context),
        appBar: _appBar(context),
        body: Observer(builder: (_) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              _adminServciesScreenModel.isLoadingMainItems &&
                      _adminServciesScreenModel.isLoadingItems
                  ? Column(
                      children: [
                        CustomTitleText(
                            title: 'Ana Kısım', color: ColorConstants.bgColor),
                        _mainText(context).getPaddingOnly(
                            context: context, top: 0.02, bottom: 0.02),
                        _mainImage(context: context),
                        SizedBox(
                          width: context.getSizeHeight(size: 0.98),
                          height: context.getSizeHeight(size: 1),
                          child: _servicesScreenItems()
                              .getPaddingOnly(context: context, top: 0.02),
                        ),
                      ],
                    )
                  : const CustomCircularProgress()
            ],
          );
        }),
      ),
    );
  }

  FloatingActionButton _addPostButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorConstants.orangeColor,
      child: const Icon(CupertinoIcons.add, color: ColorConstants.whiteColor),
      onPressed: () async => await _postShowDialog(
          context: context,
          title: 'Yeni Hizmet Ekle',
          onPressed: () async =>
              await _adminServciesScreenModel.postServicesScreenItems(
                content: _adminServciesScreenModel
                    .updateContentController.value.text,
                text: _adminServciesScreenModel.updateTextController.value.text,
                imageUrl:
                    _adminServciesScreenModel.updateImageController.value.text,
                context: context,
              )),
    );
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon:
                const Icon(CupertinoIcons.back, color: ColorConstants.bgColor)),
        title: 'Hizmetler Sayfası',
        centerTitle: false);
  }

  ListView _servicesScreenItems() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) =>
          SizedBox(height: context.getSizeHeight(size: 0.02)),
      itemCount: _adminServciesScreenModel.items.length,
      itemBuilder: (context, index) => Column(
        children: [
          CustomTitleText(
                  title: '${index + 1}. Başlık', color: ColorConstants.bgColor)
              .getPaddingOnly(context: context, bottom: 0.02),
          _wordContainer(
                  text: _adminServciesScreenModel.items[index].fields?.text?.stringValue ??
                      _adminServciesScreenModel.textLoadError,
                  onPressed: () async => await _wordShowDialog(
                      context: context,
                      title: '${index + 1}. Başlık',
                      oldWord:
                          _adminServciesScreenModel.items[index].fields?.text?.stringValue ??
                              _adminServciesScreenModel.textLoadError,
                      onPressed: () async => await _adminServciesScreenModel.updateMainText(
                          content: _adminServciesScreenModel
                                  .items[index].fields?.content?.stringValue ??
                              _adminServciesScreenModel.textLoadError,
                          link:
                              '${UrlEnum.urlServicesScreen.url}/${_adminServciesScreenModel.items[index].name!.split('/').last}',
                          updateWord: _adminServciesScreenModel
                              .updateTextController.value.text,
                          image: _adminServciesScreenModel
                                  .items[index].fields?.image?.stringValue ??
                              _adminServciesScreenModel.imageLoadError,
                          context: context)),
                  context: context)
              .getPaddingOnly(context: context, bottom: 0.02),
          _wordContainer(
              text: _adminServciesScreenModel.items[index].fields?.content?.stringValue ??
                  _adminServciesScreenModel.textLoadError,
              onPressed: () async => await _wordShowDialog(
                  context: context,
                  title: '${index + 1}. İçerik',
                  oldWord: _adminServciesScreenModel
                          .items[index].fields?.content?.stringValue ??
                      _adminServciesScreenModel.textLoadError,
                  onPressed: () async => await _adminServciesScreenModel.updateMainText(
                      content: _adminServciesScreenModel
                          .updateTextController.value.text,
                      link:
                          '${UrlEnum.urlServicesScreen.url}/${_adminServciesScreenModel.items[index].name!.split('/').last}',
                      updateWord: _adminServciesScreenModel
                              .items[index].fields?.text?.stringValue ??
                          _adminServciesScreenModel.textLoadError,
                      image: _adminServciesScreenModel
                              .items[index].fields?.image?.stringValue ??
                          _adminServciesScreenModel.imageLoadError,
                      context: context)),
              context: context),
          CustomTitleText(
                  title: '${index + 1}. Resim', color: ColorConstants.bgColor)
              .getPaddingOnly(context: context, bottom: 0.02, top: 0.02),
          _imagesContainer(
              isMainImage: false,
              context: context,
              title: '${index + 1}. Resim',
              imageUrl: _adminServciesScreenModel
                      .items[index].fields?.image?.stringValue ??
                  _adminServciesScreenModel.imageLoadError,
              content: _adminServciesScreenModel
                      .items[index].fields?.content?.stringValue ??
                  _adminServciesScreenModel.textLoadError,
              patchUrl:
                  '${UrlEnum.urlServicesScreen.url}/${_adminServciesScreenModel.items[index].name!.split('/').last}',
              text: _adminServciesScreenModel
                      .items[index].fields?.text?.stringValue ??
                  _adminServciesScreenModel.textLoadError)
        ],
      ),
    );
  }

  Container _mainImage({required BuildContext context}) {
    return _imagesContainer(
        content: '',
        isMainImage: true,
        text: _adminServciesScreenModel.mainItems.mainText ??
            _adminServciesScreenModel.textLoadError,
        context: context,
        title: 'Ana Resim',
        patchUrl: UrlEnum.urlServicesScreenMainImageText.url,
        imageUrl: _adminServciesScreenModel.mainItems.mainImage ??
            _adminServciesScreenModel.imageLoadError);
  }

  Padding _mainText(BuildContext context) {
    return _wordContainer(
        text: _adminServciesScreenModel.mainItems.mainText ??
            _adminServciesScreenModel.textLoadError,
        onPressed: () async => await _wordShowDialog(
            context: context,
            title: 'Ana Kısım Yazısı',
            oldWord: _adminServciesScreenModel.mainItems.mainText ??
                _adminServciesScreenModel.textLoadError,
            onPressed: () async =>
                await _adminServciesScreenModel.updateMainText(
                    content: '',
                    link: UrlEnum.urlServicesScreenMainImageText.url,
                    updateWord: _adminServciesScreenModel
                        .updateTextController.value.text,
                    image: _adminServciesScreenModel.mainItems.mainImage ??
                        _adminServciesScreenModel.imageLoadError,
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
        content: _adminServciesScreenModel.isLoadingMainItems
            ? CustomLabelText(
                label: 'Güncel $title: $oldWord', isColorNotWhite: true)
            : const CustomCircularProgress(),
        actions: [
          Column(
            children: [
              CustomTextField(
                controller: _adminServciesScreenModel.updateTextController,
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

  Future<dynamic> _postShowDialog(
      {required BuildContext context,
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
                controller: _adminServciesScreenModel.updateTextController,
                label: 'Yeni Yazı',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomTextField(
                controller: _adminServciesScreenModel.updateContentController,
                label: 'Yeni İçerik',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomTextField(
                controller: _adminServciesScreenModel.updateImageController,
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
                  onPressed: () async =>
                      _adminServciesScreenModel.updateImageController.value.text !=
                                  '' &&
                              _adminServciesScreenModel
                                  .updateImageController.value.text
                                  .contains('https://')
                          ? await _adminServciesScreenModel
                              .postServicesScreenItems(
                              content: _adminServciesScreenModel
                                  .updateContentController.value.text,
                              text: _adminServciesScreenModel
                                  .updateTextController.value.text,
                              imageUrl: _adminServciesScreenModel
                                  .updateImageController.value.text,
                              context: context,
                            )
                          : _adminServciesScreenModel.imageData != ''
                              ? await _adminServciesScreenModel
                                  .postServicesScreenItems(
                                      content:
                                          _adminServciesScreenModel
                                              .updateContentController
                                              .value
                                              .text,
                                      context: context,
                                      imageUrl: _adminServciesScreenModel
                                          .updateImageController.value.text,
                                      text: _adminServciesScreenModel
                                          .updateTextController.value.text)
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
          _adminServciesScreenModel.isLoadingMainItems
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
                          onPressed: () async => await _adminServciesScreenModel
                              .updateImageFromWebFolder(
                                  content: content,
                                  text: text,
                                  context: context,
                                  url: patchUrl)),
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
                          onPressed: () async => await _adminServciesScreenModel
                              .updateImageFromWebFolder(
                                  content: content,
                                  text: text,
                                  context: context,
                                  url: patchUrl))),
                ],
              ),
              isMainImage
                  ? const SizedBox()
                  : CustomIconButton(
                          icon: const Icon(CupertinoIcons.delete,
                              color: ColorConstants.orangeColor),
                          onPressed: () async => await _adminServciesScreenModel
                              .deleteServicesScreenItems(
                                  link: patchUrl, context: context))
                      .getPaddingOnly(context: context, right: 0.02)
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
                controller: _adminServciesScreenModel.updateImageController,
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
                  onPressed: () async => _adminServciesScreenModel
                                  .updateImageController.value.text !=
                              '' &&
                          _adminServciesScreenModel
                              .updateImageController.value.text
                              .contains('https://')
                      ? await _adminServciesScreenModel.updateImageFromLink(
                          content: content,
                          text: text,
                          context: context,
                          link: _adminServciesScreenModel
                              .updateImageController.value.text,
                          patchUrl: patchUrl)
                      : _adminServciesScreenModel.imageData != ''
                          ? await _adminServciesScreenModel
                              .updateImageFromWebFolder(
                                  content: content,
                                  text: text,
                                  context: context,
                                  url: patchUrl)
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
