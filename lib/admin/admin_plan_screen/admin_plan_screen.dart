import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_plan_screen/admin_plan_screen_model/admin_plan_screen_model.dart';
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

class AdminPlanScreen extends StatelessWidget {
  AdminPlanScreen({super.key}) {
    reaction((_) async => await _adminPlanScreenModel.initialize(), (_) {},
        name: 'planScreen');
  }
  final AdminPlanScreenModel _adminPlanScreenModel = AdminPlanScreenModel();
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
              _adminPlanScreenModel.isLoadingMainItems &&
                      _adminPlanScreenModel.isLoadingItems
                  ? Column(
                      children: [
                        CustomTitleText(
                            title: 'Ana Kısım', color: ColorConstants.bgColor),
                        _mainText(context).getPaddingOnly(
                            context: context, top: 0.02, bottom: 0.02),
                        _mainImage(context),
                        SizedBox(
                          height: context.getSizeHeight(size: 1),
                          width: context.getSizeWidth(size: 0.98),
                          child: _planScreenItems()
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
          title: 'Yeni Plan Ekle',
          onPressed: () async =>
              await _adminPlanScreenModel.postPlanScreenItems(
                text: _adminPlanScreenModel.updateTextController.value.text,
                imageUrl:
                    _adminPlanScreenModel.updateImageController.value.text,
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
        title: 'Organizasyon Sayfası',
        centerTitle: false);
  }

  ListView _planScreenItems() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) =>
          SizedBox(height: context.getSizeHeight(size: 0.02)),
      itemCount: _adminPlanScreenModel.items.length,
      itemBuilder: (context, index) => Column(
        children: [
          CustomTitleText(
                  title: '${index + 1}. Başlık', color: ColorConstants.bgColor)
              .getPaddingOnly(context: context, bottom: 0.02),
          _wordContainer(
                  text: _adminPlanScreenModel.items[index].fields?.text?.stringValue ??
                      _adminPlanScreenModel.textLoadError,
                  onPressed: () async => await _wordShowDialog(
                      context: context,
                      title: '${index + 1}. Başlık',
                      oldWord:
                          _adminPlanScreenModel.items[index].fields?.text?.stringValue ??
                              _adminPlanScreenModel.textLoadError,
                      onPressed: () async => await _adminPlanScreenModel.updateMainText(
                          content: _adminPlanScreenModel
                                  .items[index].fields?.content?.stringValue ??
                              _adminPlanScreenModel.textLoadError,
                          link:
                              '${UrlEnum.urlPlanScreen.url}/${_adminPlanScreenModel.items[index].name!.split('/').last}',
                          updateWord: _adminPlanScreenModel
                              .updateTextController.value.text,
                          image: _adminPlanScreenModel
                                  .items[index].fields?.image?.stringValue ??
                              _adminPlanScreenModel.imageLoadError,
                          context: context)),
                  context: context)
              .getPaddingOnly(context: context, bottom: 0.02),
          _wordContainer(
              text:
                  _adminPlanScreenModel.items[index].fields?.content?.stringValue ??
                      _adminPlanScreenModel.textLoadError,
              onPressed: () async => await _wordShowDialog(
                  context: context,
                  title: '${index + 1}. İçerik',
                  oldWord: _adminPlanScreenModel
                          .items[index].fields?.content?.stringValue ??
                      _adminPlanScreenModel.textLoadError,
                  onPressed: () async => await _adminPlanScreenModel.updateMainText(
                      content:
                          _adminPlanScreenModel.updateTextController.value.text,
                      link:
                          '${UrlEnum.urlPlanScreen.url}/${_adminPlanScreenModel.items[index].name!.split('/').last}',
                      updateWord: _adminPlanScreenModel
                              .items[index].fields?.text?.stringValue ??
                          _adminPlanScreenModel.textLoadError,
                      image: _adminPlanScreenModel
                              .items[index].fields?.image?.stringValue ??
                          _adminPlanScreenModel.imageLoadError,
                      context: context)),
              context: context),
          CustomTitleText(
                  title: '${index + 1}. Resim', color: ColorConstants.bgColor)
              .getPaddingOnly(context: context, bottom: 0.02, top: 0.02),
          _imagesContainer(
              isMainImage: false,
              context: context,
              title: '${index + 1}. Resim',
              imageUrl: _adminPlanScreenModel
                      .items[index].fields?.image?.stringValue ??
                  _adminPlanScreenModel.imageLoadError,
              content: _adminPlanScreenModel
                      .items[index].fields?.content?.stringValue ??
                  _adminPlanScreenModel.textLoadError,
              patchUrl:
                  '${UrlEnum.urlPlanScreen.url}/${_adminPlanScreenModel.items[index].name!.split('/').last}',
              text: _adminPlanScreenModel
                      .items[index].fields?.text?.stringValue ??
                  _adminPlanScreenModel.textLoadError)
        ],
      ),
    );
  }

  Container _mainImage(BuildContext context) {
    return _imagesContainer(
        content: '',
        isMainImage: true,
        text: _adminPlanScreenModel.mainItems.mainText ??
            _adminPlanScreenModel.textLoadError,
        context: context,
        title: 'Ana Resim',
        patchUrl: UrlEnum.urlPlanScreenMainImageText.url,
        imageUrl: _adminPlanScreenModel.mainItems.mainImage ??
            _adminPlanScreenModel.imageLoadError);
  }

  Padding _mainText(BuildContext context) {
    return _wordContainer(
        text: _adminPlanScreenModel.mainItems.mainText ??
            _adminPlanScreenModel.textLoadError,
        onPressed: () async => await _wordShowDialog(
            context: context,
            title: 'Ana Kısım Yazısı',
            oldWord: _adminPlanScreenModel.mainItems.mainText ??
                _adminPlanScreenModel.textLoadError,
            onPressed: () async => await _adminPlanScreenModel.updateMainText(
                content: '',
                link: UrlEnum.urlPlanScreenMainImageText.url,
                updateWord:
                    _adminPlanScreenModel.updateTextController.value.text,
                image: _adminPlanScreenModel.mainItems.mainImage ??
                    _adminPlanScreenModel.imageLoadError,
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
        content: _adminPlanScreenModel.isLoadingMainItems
            ? CustomLabelText(
                label: 'Güncel $title: $oldWord', isColorNotWhite: true)
            : const CustomCircularProgress(),
        actions: [
          Column(
            children: [
              CustomTextField(
                controller: _adminPlanScreenModel.updateTextController,
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
                controller: _adminPlanScreenModel.updateTextController,
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
                controller: _adminPlanScreenModel.updateImageController,
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
                  onPressed: () async => _adminPlanScreenModel
                                  .updateImageController.value.text !=
                              '' &&
                          _adminPlanScreenModel.updateImageController.value.text
                              .contains('https://')
                      ? await _adminPlanScreenModel.postPlanScreenItems(
                          text: _adminPlanScreenModel
                              .updateTextController.value.text,
                          imageUrl: _adminPlanScreenModel
                              .updateImageController.value.text,
                          context: context,
                        )
                      : _adminPlanScreenModel.imageData != ''
                          ? await _adminPlanScreenModel.postPlanScreenItems(
                              context: context,
                              imageUrl: _adminPlanScreenModel
                                  .updateImageController.value.text,
                              text: _adminPlanScreenModel
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
          _adminPlanScreenModel.isLoadingMainItems
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
                          onPressed: () async => await _adminPlanScreenModel
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
                          onPressed: () async => await _adminPlanScreenModel
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
                          onPressed: () async =>
                              await _adminPlanScreenModel.deletePlanScreenItems(
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
                controller: _adminPlanScreenModel.updateImageController,
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
                  onPressed: () async => _adminPlanScreenModel
                                  .updateImageController.value.text !=
                              '' &&
                          _adminPlanScreenModel.updateImageController.value.text
                              .contains('https://')
                      ? await _adminPlanScreenModel.updateImageFromLink(
                          content: content,
                          text: text,
                          context: context,
                          link: _adminPlanScreenModel
                              .updateImageController.value.text,
                          patchUrl: patchUrl)
                      : _adminPlanScreenModel.imageData != ''
                          ? await _adminPlanScreenModel
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
