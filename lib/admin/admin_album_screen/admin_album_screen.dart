import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_album_screen/admin_album_screen_model/admin_album_screen_model.dart';
import 'package:wedding_organise/core/extensions/padding_extension.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';

import '../../core/constants/color_constants.dart';
import '../../core/enum/url_enum.dart';
import '../../core/widgets/appbar_widget.dart';
import '../../core/widgets/elevated_button_widget.dart';
import '../../core/widgets/icon_button_widget.dart';
import '../../core/widgets/label_text_widget.dart';
import '../../core/widgets/progress_indicator.dart';
import '../../core/widgets/text_widget.dart';
import '../../core/widgets/textfield_widget.dart';
import '../../core/widgets/title_text_widget.dart';
import '../../service/album/album_model/album_model.dart';

class AdminAlbumScreen extends StatelessWidget {
  AdminAlbumScreen({super.key}) {
    reaction(
      (_) async => await _adminAlbumScreenModel.initialize(),
      (_) {},
    );
  }
  final AdminAlbumScreenModel _adminAlbumScreenModel = AdminAlbumScreenModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (_) {
        return Scaffold(
          floatingActionButton: _addPostButton(
            context: context,
          ),
          appBar: _appBar(context),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              _adminAlbumScreenModel.isLoadingMainItems &&
                      _adminAlbumScreenModel.isLoadingItems
                  ? Column(
                      children: [
                        CustomTitleText(
                            title: 'Ana Kısım', color: ColorConstants.bgColor),
                        _mainText(context).getPaddingOnly(
                            context: context, top: 0.02, bottom: 0.02),
                        _mainImage(context),
                        _adminAlbumScreenModel.albumScreenWedding.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart: UrlEnum.urlAlbumScreenWedding.url,
                                context: context,
                                album:
                                    _adminAlbumScreenModel.albumScreenWedding,
                                label: 'NİKAH')
                            : const SizedBox(),
                        _adminAlbumScreenModel.albumScreenAskGirl.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart: UrlEnum.urlAlbumScreenAskGirl.url,
                                context: context,
                                album:
                                    _adminAlbumScreenModel.albumScreenAskGirl,
                                label: 'KIZ İSTEME')
                            : const SizedBox(),
                        _adminAlbumScreenModel.albumScreenEngagement.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart:
                                    UrlEnum.urlAlbumScreenEngagement.url,
                                context: context,
                                album: _adminAlbumScreenModel
                                    .albumScreenEngagement,
                                label: 'SÖZ - NİŞAN')
                            : const SizedBox(),
                        _adminAlbumScreenModel.albumScreenHenna.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart: UrlEnum.urlAlbumScreenHenna.url,
                                context: context,
                                album: _adminAlbumScreenModel.albumScreenHenna,
                                label: 'KINA')
                            : const SizedBox(),
                        _adminAlbumScreenModel
                                .albumScreenMarriageProposal.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart:
                                    UrlEnum.urlAlbumScreenMarriageProposal.url,
                                context: context,
                                album: _adminAlbumScreenModel
                                    .albumScreenMarriageProposal,
                                label: 'EVLİLİK TEKLİFİ')
                            : const SizedBox(),
                        _adminAlbumScreenModel.albumScreenBridalBath.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart:
                                    UrlEnum.urlAlbumScreenBridalBath.url,
                                context: context,
                                album: _adminAlbumScreenModel
                                    .albumScreenBridalBath,
                                label: 'GELİN HAMAMI')
                            : const SizedBox(),
                        _adminAlbumScreenModel.albumScreenBrideToBe.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart:
                                    UrlEnum.urlAlbumScreenBrideToBe.url,
                                context: context,
                                album:
                                    _adminAlbumScreenModel.albumScreenBrideToBe,
                                label: 'BEKARLIĞA VEDA (BRİDE TO BE)')
                            : const SizedBox(),
                        _adminAlbumScreenModel.albumScreenBirthDay.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart:
                                    UrlEnum.urlAlbumScreenBirthDay.url,
                                context: context,
                                album:
                                    _adminAlbumScreenModel.albumScreenBirthDay,
                                label: 'DOĞUM GÜNÜ')
                            : const SizedBox(),
                        _adminAlbumScreenModel.albumScreenAnnivesary.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart:
                                    UrlEnum.urlAlbumScreenAnniversary.url,
                                context: context,
                                album: _adminAlbumScreenModel
                                    .albumScreenAnnivesary,
                                label: 'YIL DÖNÜMÜ')
                            : const SizedBox(),
                        _adminAlbumScreenModel
                                .albumScreenCircumcision.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart:
                                    UrlEnum.urlAlbumScreenCircumCision.url,
                                context: context,
                                album: _adminAlbumScreenModel
                                    .albumScreenCircumcision,
                                label: 'SÜNNET')
                            : const SizedBox(),
                        _adminAlbumScreenModel.albumScreenBabyShower.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart:
                                    UrlEnum.urlAlbumScreenBabyShower.url,
                                context: context,
                                album: _adminAlbumScreenModel
                                    .albumScreenBabyShower,
                                label: 'CİNSİYET PARTİSİ')
                            : const SizedBox(),
                        _adminAlbumScreenModel.albumScreenOpening.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart: UrlEnum.urlAlbumScreenOpening.url,
                                context: context,
                                album:
                                    _adminAlbumScreenModel.albumScreenOpening,
                                label: 'AÇILIŞ - KUTLAMA - DAVET')
                            : const SizedBox(),
                        _adminAlbumScreenModel.albumScreenNewYear.isNotEmpty
                            ? _listAlbums(
                                urlFirstPart: UrlEnum.urlAlbumScreenNewYear.url,
                                context: context,
                                album:
                                    _adminAlbumScreenModel.albumScreenNewYear,
                                label: 'YENİ YIL')
                            : const SizedBox(),
                      ],
                    )
                  : const CustomCircularProgress()
            ],
          ),
        );
      }),
    );
  }

  Column _listAlbums(
      {required BuildContext context,
      required List<AlbumDocuments> album,
      required String urlFirstPart,
      required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabelText(label: label, isColorNotWhite: true)
            .getPaddingOnly(context: context, bottom: 0.02, left: 0.02),
        SizedBox(
          height: context.getSizeHeight(size: 0.4),
          width: context.getSizeWidth(size: 1),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: album.length,
              itemBuilder: (context, index) => _images(
                  patchUrl:
                      '$urlFirstPart/${album[index].name!.split('/').last}',
                  title: '$label Kategorisi',
                  context: context,
                  image: album[index].fields?.albumImage?.stringValue ??
                      _adminAlbumScreenModel.imageLoadError)),
        ),
      ],
    );
  }

  Container _images(
      {required BuildContext context,
      required String image,
      required String patchUrl,
      required String title}) {
    return _imageContainer(
        context: context, image: image, patchUrl: patchUrl, title: title);
  }

  Container _imageContainer(
      {required BuildContext context,
      required String image,
      required String patchUrl,
      required String title}) {
    return Container(
        padding: EdgeInsets.only(left: context.getSizeWidth(size: 0.02)),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: defaultTargetPlatform == TargetPlatform.linux ||
                defaultTargetPlatform == TargetPlatform.macOS ||
                defaultTargetPlatform == TargetPlatform.windows
            ? context.getSizeWidth(size: 0.4)
            : context.getSizeWidth(size: 0.8),
        child: GestureDetector(
          onTap: () async => await _imageShowDialog(
              patchUrl: patchUrl,
              context: context,
              title: title,
              onPressed: () async => await _adminAlbumScreenModel
                  .updateImageFromWebFolder(context: context, url: patchUrl)),
          child: image.contains('https://')
              ? Image.network(image,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      height: context.getSizeHeight(size: 0.8))
                  .getPaddingOnly(context: context, bottom: 0.02)
                  .getPaddingOnly(context: context, bottom: 0.02)
              : Image.memory(
                  base64Decode(image),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  height: context.getSizeHeight(size: 0.8),
                )
                  .getPaddingOnly(context: context, bottom: 0.02)
                  .getPaddingOnly(context: context, bottom: 0.02),
        ));
  }

  FloatingActionButton _addPostButton({required BuildContext context}) {
    return FloatingActionButton(
      backgroundColor: ColorConstants.orangeColor,
      child: const Icon(CupertinoIcons.add, color: ColorConstants.whiteColor),
      onPressed: () async => await _postShowDialog(
          context: context,
          title: 'Yeni Fotoğraf Ekle',
          onPressed: () async =>
              await _adminAlbumScreenModel.postAlbumScreenItems(
                linkController: _adminAlbumScreenModel.linkController.value.text
                    .toUpperCase(),
                imageUrl:
                    _adminAlbumScreenModel.updateImageController.value.text,
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
        title: 'Albüm Sayfası',
        centerTitle: false);
  }

  Padding _mainText(BuildContext context) {
    return _wordContainer(
        text: _adminAlbumScreenModel.mainItems.mainText ??
            _adminAlbumScreenModel.textLoadError,
        onPressed: () async => await _wordShowDialog(
            context: context,
            title: 'Ana Kısım Yazısı',
            oldWord: _adminAlbumScreenModel.mainItems.mainText ??
                _adminAlbumScreenModel.textLoadError,
            onPressed: () async => await _adminAlbumScreenModel.updateMainText(
                content: '',
                link: UrlEnum.urlAlbumsScreenMainImageText.url,
                updateWord:
                    _adminAlbumScreenModel.updateTextController.value.text,
                image: _adminAlbumScreenModel.mainItems.mainImage ??
                    _adminAlbumScreenModel.imageLoadError,
                context: context)),
        context: context);
  }

  Container _mainImage(BuildContext context) {
    return _imagesContainer(
        isMainImage: true,
        context: context,
        title: 'Ana Resim',
        patchUrl: UrlEnum.urlAlbumsScreenMainImageText.url,
        imageUrl: _adminAlbumScreenModel.mainItems.mainImage ??
            _adminAlbumScreenModel.imageLoadError);
  }

  Container _imagesContainer(
      {required BuildContext context,
      required bool isMainImage,
      required String title,
      required String patchUrl,
      required String imageUrl}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          _adminAlbumScreenModel.isLoadingMainItems
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
                          patchUrl: patchUrl,
                          context: context,
                          title: title,
                          onPressed: () async => await _adminAlbumScreenModel
                              .updateImageFromWebFolder(
                                  context: context, url: patchUrl)),
                      child: CustomText(
                          text: 'Güncelle', color: ColorConstants.orangeColor)),
                  CustomIconButton(
                      icon: const Icon(
                        CupertinoIcons.pen,
                        color: ColorConstants.orangeColor,
                      ),
                      onPressed: () async => await _imageShowDialog(
                          patchUrl: patchUrl,
                          context: context,
                          title: title,
                          onPressed: () async => await _adminAlbumScreenModel
                              .updateImageFromWebFolder(
                                  context: context, url: patchUrl))),
                ],
              ),
              isMainImage
                  ? const SizedBox()
                  : CustomIconButton(
                          icon: const Icon(CupertinoIcons.delete,
                              color: ColorConstants.orangeColor),
                          onPressed: () async => await _adminAlbumScreenModel
                              .deleteAlbumScreenItems(
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
                controller: _adminAlbumScreenModel.updateImageController,
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
                  onPressed: () async => _adminAlbumScreenModel
                                  .updateImageController.value.text !=
                              '' &&
                          _adminAlbumScreenModel
                              .updateImageController.value.text
                              .contains('https://')
                      ? await _adminAlbumScreenModel.updateImageFromLink(
                          context: context,
                          link: _adminAlbumScreenModel
                              .updateImageController.value.text,
                          patchUrl: patchUrl)
                      : _adminAlbumScreenModel.imageData != ''
                          ? await _adminAlbumScreenModel
                              .updateImageFromWebFolder(
                                  context: context, url: patchUrl)
                          : null).getPaddingOnly(
                  context: context, left: 0.3, right: 0.3, bottom: 0.02),
              CustomElevatedButton(
                  buttonText: 'Sil',
                  onPressed: () async =>
                      await _adminAlbumScreenModel.deleteAlbumScreenItems(
                          link: patchUrl, context: context)).getPaddingOnly(
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
        content: _adminAlbumScreenModel.isLoadingMainItems
            ? CustomLabelText(
                label: 'Güncel $title: $oldWord', isColorNotWhite: true)
            : const CustomCircularProgress(),
        actions: [
          Column(
            children: [
              CustomTextField(
                controller: _adminAlbumScreenModel.updateTextController,
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
                controller: _adminAlbumScreenModel.linkController,
                label:
                    'Küçük Harflerle Kategoriyi Yazın: Nikah, Kız isteme, Nişan, Evlilik Teklifi, Gelin Hamamı, Bekarlığa Veda, Doğum Günü, Yıl Dönümü, Sünnet, Baby Shower, Açılış, Yeni Yıl',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomTextField(
                controller: _adminAlbumScreenModel.updateImageController,
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
                  onPressed: () async => _adminAlbumScreenModel
                                  .updateImageController.value.text !=
                              '' &&
                          _adminAlbumScreenModel
                              .updateImageController.value.text
                              .contains('https://')
                      ? await _adminAlbumScreenModel.postAlbumScreenItems(
                          linkController: _adminAlbumScreenModel
                              .linkController.value.text
                              .toUpperCase(),
                          imageUrl: _adminAlbumScreenModel
                              .updateImageController.value.text,
                          context: context,
                        )
                      : _adminAlbumScreenModel.imageData != ''
                          ? await _adminAlbumScreenModel.postAlbumScreenItems(
                              linkController: _adminAlbumScreenModel
                                  .linkController.value.text
                                  .toUpperCase(),
                              context: context,
                              imageUrl: _adminAlbumScreenModel
                                  .updateImageController.value.text,
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
