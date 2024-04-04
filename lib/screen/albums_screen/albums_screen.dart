import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:wedding_organise/core/extensions/padding_extension.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';
import 'package:wedding_organise/core/widgets/icon_button_widget.dart';
import 'package:wedding_organise/core/widgets/label_text_widget.dart';
import 'package:wedding_organise/core/widgets/text_widget.dart';
import 'package:wedding_organise/screen/albums_screen/albums_screen_model/albums_screen_model.dart';

import '../../core/constants/color_constants.dart';
import '../../core/helper/custom_lottie_splash_view.dart';
import '../../core/widgets/slide_bar_widget/slide_bar_widget.dart';
import '../../core/widgets/title_text_widget.dart';
import '../../service/album/album_model/album_model.dart';

class AlbumsScreen extends StatelessWidget {
  AlbumsScreen({super.key}) {
    reaction((_) async => await _albumsScreenModel.initialize(), (_) {},
        name: 'planScreen');
  }
  final AlbumsScreenModel _albumsScreenModel = AlbumsScreenModel();
  @override
  Widget build(BuildContext context) {
    return CustomSlideBarWidget(
      title: 'Eventopya',
      body: Observer(
          builder: (context) => _albumsScreenModel.isLoading
              ? ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _firstCard(context)
                        .getPaddingOnly(context: context, bottom: 0.04),
                    _albumsScreenModel.albumScreenWedding.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenWedding,
                            label: 'NİKAH')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenAskGirl.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenAskGirl,
                            label: 'KIZ İSTEME')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenEngagement.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenEngagement,
                            label: 'SÖZ - NİŞAN')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenHenna.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenHenna,
                            label: 'KINA')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenMarriageProposal.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album:
                                _albumsScreenModel.albumScreenMarriageProposal,
                            label: 'EVLİLİK TEKLİFİ')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenBridalBath.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenBridalBath,
                            label: 'GELİN HAMAMI')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenBrideToBe.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenBrideToBe,
                            label: 'BEKARLIĞA VEDA (BRİDE TO BE)')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenBirthDay.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenBirthDay,
                            label: 'DOĞUM GÜNÜ')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenAnnivesary.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenAnnivesary,
                            label: 'YIL DÖNÜMÜ')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenCircumcision.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenCircumcision,
                            label: 'SÜNNET')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenBabyShower.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenBabyShower,
                            label: 'CİNSİYET PARTİSİ')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenOpening.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenOpening,
                            label: 'AÇILIŞ - KUTLAMA - DAVET')
                        : const SizedBox(),
                    _albumsScreenModel.albumScreenNewYear.isNotEmpty
                        ? _listAlbums(
                            context: context,
                            album: _albumsScreenModel.albumScreenNewYear,
                            label: 'YENİ YIL')
                        : const SizedBox(),
                  ],
                )
              : const CustomLottieSplashView()),
    );
  }

  Column _listAlbums(
      {required BuildContext context,
      required List<AlbumDocuments> album,
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
                  context: context,
                  image: album[index].fields?.albumImage?.stringValue ??
                      _albumsScreenModel.imageLoadError)),
        ),
      ],
    );
  }

  Container _images({required BuildContext context, required String image}) {
    return _imageContainer(context: context, image: image);
  }

  Container _imageContainer(
      {required BuildContext context, required String image}) {
    return Container(
      padding: EdgeInsets.only(left: context.getSizeWidth(size: 0.02)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      width: defaultTargetPlatform == TargetPlatform.linux ||
              defaultTargetPlatform == TargetPlatform.macOS ||
              defaultTargetPlatform == TargetPlatform.windows
          ? context.getSizeWidth(size: 0.4)
          : context.getSizeWidth(size: 0.8),
      child: GestureDetector(
          onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  actions: [
                    Container(
                      color: Colors.transparent,
                      height: context.getSizeHeight(size: 0.8),
                      width: context.getSizeWidth(size: 0.8),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: CustomIconButton(
                                icon: const Icon(Icons.close,
                                    color: ColorConstants.whiteColor),
                                onPressed: () => Navigator.of(context).pop()),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: context.getSizeHeight(size: 0.7),
                              width: context.getSizeWidth(size: 0.8),
                              child: image.contains('https://')
                                  ? Image.network(image,
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.cover,
                                          height:
                                              context.getSizeHeight(size: 0.8))
                                      .getPaddingOnly(
                                          context: context, bottom: 0.02)
                                  : Image.memory(
                                      base64Decode(image),
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                      height: context.getSizeHeight(size: 0.8),
                                    ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
          child: image.contains('https://')
              ? Image.network(image,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      height: context.getSizeHeight(size: 0.8))
                  .getPaddingOnly(context: context, bottom: 0.02)
              : Image.memory(
                  base64Decode(image),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  height: context.getSizeHeight(size: 0.8),
                ).getPaddingOnly(context: context, bottom: 0.02)),
    );
  }

  Container _firstCard(BuildContext context) {
    return Container(
        width: context.getSizeWidth(size: 1),
        height: context.getSizeHeight(size: 0.3),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            image: _albumsScreenModel.mainItems.mainImage!.contains('https://')
                ? DecorationImage(
                    image: NetworkImage(
                      _albumsScreenModel.mainItems.mainImage ??
                          _albumsScreenModel.imageLoadError,
                    ),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high)
                : DecorationImage(
                    image: MemoryImage(
                      base64Decode(_albumsScreenModel.mainItems.mainImage!),
                    ),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high)),
        child: Center(
            child: CustomTitleText(
                title: _albumsScreenModel.mainItems.mainText ??
                    _albumsScreenModel.textLoadError,
                color: ColorConstants.whiteColor)));
  }
}
