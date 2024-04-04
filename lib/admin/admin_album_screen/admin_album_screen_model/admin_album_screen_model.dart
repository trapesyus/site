import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import '../../../service/album/album_service/album_sub_service/album_sub_service.dart';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_album_screen/admin_album_screen.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/snackbar_extension.dart';
import 'package:wedding_organise/service/album/album_model/album_model.dart';
import 'package:wedding_organise/service/album/album_model/allbum_sub_model/album_sub_model.dart';
import 'package:wedding_organise/service/album/album_service/album_service.dart';
import '../../../core/enum/url_enum.dart';
part 'admin_album_screen_model.g.dart';

class AdminAlbumScreenModel = _AdminAlbumScreenModelBase
    with _$AdminAlbumScreenModel;

abstract class _AdminAlbumScreenModelBase with Store {
  @observable
  bool isLoadingMainItems = false;
  @observable
  bool isLoadingItems = false;

  @observable
  String textLoadError = 'Bir Hata Oluştu';
  @observable
  String imageLoadError = 'https://wallpaperaccess.com/full/4624260.jpg';

  @observable
  TextEditingController updateTextController = TextEditingController();
  @observable
  TextEditingController updateImageController = TextEditingController();
  @observable
  TextEditingController linkController = TextEditingController();

  @observable
  AlbumsSubScreenModel mainItems = AlbumsSubScreenModel();
  final AlbumSubService _albumSubService = AlbumSubService();
  @observable
  String imageData = '';

  @observable
  List<AlbumDocuments> items = ObservableList.of([]);
  final AlbumScreenService _albumScreenService = AlbumScreenService();

  @observable
  List<AlbumDocuments> albumScreenAnnivesary = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenAskGirl = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenBabyShower = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenBirthDay = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenBridalBath = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenBrideToBe = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenCircumcision = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenEngagement = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenHenna = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenMarriageProposal = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenNewYear = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenOpening = ObservableList.of([]);
  @observable
  List<AlbumDocuments> albumScreenWedding = ObservableList.of([]);

  Future<void> initialize() async {
    await getMainImageText().whenComplete(() => isLoadingMainItems = true);
    await getAlbumScreenAnnivesary();
    await getAlbumScreenAskGirl();
    await getAlbumScreenBabyShower();
    await getAlbumScreenBirthDay();
    await getAlbumScreenBridalBath();
    await getAlbumScreenBrideToBe();
    await getAlbumScreenCircumcision();
    await getAlbumScreenEngagement();
    await getAlbumScreenHenna();
    await getAlbumScreenMarriageProposal();
    await getAlbumScreenNewYear();
    await getAlbumScreenOpening();
    await getAlbumScreenWedding();
    isLoadingItems = true;
  }

  Future<void> getMainImageText() async {
    mainItems = await _albumSubService.getAlbumScreenMainImageText()!;
  }

  Future<void> getAlbumScreenAnnivesary() async {
    albumScreenAnnivesary = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenAnniversary.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenAskGirl() async {
    albumScreenAskGirl = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenAskGirl.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenBabyShower() async {
    albumScreenBabyShower = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenBabyShower.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenBirthDay() async {
    albumScreenBirthDay = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenBirthDay.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenBridalBath() async {
    albumScreenBridalBath = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenBridalBath.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenBrideToBe() async {
    albumScreenBrideToBe = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenBrideToBe.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenCircumcision() async {
    albumScreenCircumcision = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenCircumCision.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenEngagement() async {
    albumScreenEngagement = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenEngagement.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenHenna() async {
    albumScreenHenna = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenHenna.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenMarriageProposal() async {
    albumScreenMarriageProposal = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenMarriageProposal.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenNewYear() async {
    albumScreenNewYear = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenNewYear.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenOpening() async {
    albumScreenOpening = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenOpening.url)) ??
        [];
  }

  @action
  Future<void> getAlbumScreenWedding() async {
    albumScreenWedding = (await _albumScreenService.getAlbumScreen(
            url: UrlEnum.urlAlbumScreenWedding.url)) ??
        [];
  }

  @action
  Future<void> postAlbumScreenItems({
    required BuildContext context,
    required String imageUrl,
    required String linkController,
  }) async {
    String link = '';
    if (linkController == 'nikah'.toUpperCase()) {
      link = UrlEnum.urlAlbumScreenWedding.url;
    } else if (linkController == 'kına'.toUpperCase()) {
      link = UrlEnum.urlAlbumScreenHenna.url;
    } else if (linkController == 'kız isteme'.toUpperCase()) {
      link = UrlEnum.urlAlbumScreenAskGirl.url;
    } else if (linkController == 'nişan'.toUpperCase()) {
      link = UrlEnum.urlAlbumScreenEngagement.url;
    } else if (linkController == 'evlilik teklifi'.toUpperCase()) {
      link = UrlEnum.urlAlbumScreenMarriageProposal.url;
    } else if (linkController == 'gelin hamamı'.toUpperCase()) {
      link = UrlEnum.urlAlbumScreenBridalBath.url;
    } else if (linkController == 'bekarlığa veda'.toUpperCase()) {
      link == UrlEnum.urlAlbumScreenBrideToBe.url;
    } else if (linkController == 'doğum günü'.toUpperCase()) {
      link == UrlEnum.urlAlbumScreenBirthDay.url;
    } else if (linkController == 'yıl dönümü'.toUpperCase()) {
      link == UrlEnum.urlAlbumScreenAnniversary.url;
    } else if (linkController == 'sünnet'.toUpperCase()) {
      link == UrlEnum.urlAlbumScreenCircumCision.url;
    } else if (linkController == 'baby shower'.toUpperCase()) {
      link = UrlEnum.urlAlbumScreenBabyShower.url;
    } else if (linkController == 'açılış'.toUpperCase()) {
      link = UrlEnum.urlAlbumScreenOpening.url;
    } else if (linkController == 'yeni yıl'.toUpperCase()) {
      link == UrlEnum.urlAlbumScreenNewYear.url;
    } else {
      context.snackBarExtension(content: 'Lütfen Kategoriyi Doğru Yazın');
      return;
    }

    if (imageUrl.contains('https://') && link != '') {
      await _albumSubService
          .postAlbumScreenItems(image: imageUrl, link: link)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Yeni Plan Başarıyla Eklendi.');
          AdminAlbumScreen().navigateToPushReplacement(context: context);
        }
      });
    } else if (!imageUrl.contains('https://')) {
      Uint8List? fromPicker = await ImagePickerWeb.getImageAsBytes();
      if (fromPicker == null) return;
      imageData = base64Encode(fromPicker);
      await _albumSubService
          .postAlbumScreenItems(image: imageData, link: link)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Yeni Plan Başarıyla Eklendi.');
          AdminAlbumScreen().navigateToPushReplacement(context: context);
        }
      });
    } else if (imageUrl == '') {
      context.snackBarExtension(content: 'Resim urlsi boş olamaz');
      return;
    }
  }

  @action
  Future<void> updateMainText(
      {required String updateWord,
      required BuildContext context,
      required String content,
      required String image,
      required String link}) async {
    if (updateWord == '') {
      context.snackBarExtension(content: 'Güncellemek için yazı girin');
      return;
    }

    _albumSubService
        .patchAlbumScreenMainText(text: updateWord)
        .whenComplete(() {
      if (context.mounted) {
        context.snackBarExtension(content: 'Başarıyla Güncellendi');
        AdminAlbumScreen().navigateToPushReplacement(context: context);
      }
    });
  }

  Future<void> updateImageFromWebFolder(
      {required BuildContext context, required String url}) async {
    if (imageData.contains('https://')) return;
    Uint8List? fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker == null) return;
    imageData = base64Encode(fromPicker);

    if (url == UrlEnum.urlPlanScreenMainImageText.url) {
      await _albumSubService
          .patchAlbumScreenMainImage(image: imageData)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminAlbumScreen().navigateToPushReplacement(context: context);
        }
      });
    } else {
      await _albumSubService
          .patchAlbumScreenItems(image: imageData, link: url)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminAlbumScreen().navigateToPushReplacement(context: context);
        }
      });
    }
  }

  Future<void> deleteAlbumScreenItems(
      {required String link, required BuildContext context}) async {
    await _albumSubService.deleteAlbumScreenItems(url: link).whenComplete(() {
      if (context.mounted) {
        context.snackBarExtension(
            content: 'Silme İşlemi Başarıyla Gerçekleştirildi');
        AdminAlbumScreen().navigateToPushReplacement(context: context);
      }
    });
  }

  Future<void> updateImageFromLink(
      {required String link,
      required BuildContext context,
      required String patchUrl}) async {
    if (patchUrl == UrlEnum.urlPlanScreenMainImageText.url) {
      await _albumSubService
          .patchAlbumScreenMainImage(image: link)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminAlbumScreen().navigateToPushReplacement(context: context);
        }
      });
    } else {
      await _albumSubService
          .patchAlbumScreenItems(image: link, link: patchUrl)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminAlbumScreen().navigateToPushReplacement(context: context);
        }
      });
    }
  }
}
