import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/snackbar_extension.dart';
import 'package:wedding_organise/screen/contact_us_screen/contact_us_screen.dart';
import 'package:wedding_organise/service/contact_info/contact_info_model/contact_info_model.dart';
import 'package:wedding_organise/service/contact_info/contact_info_service/contact_info_service.dart';
import 'package:wedding_organise/service/contact_screen/contact_screen_service/contact_screen_service.dart';
import 'package:wedding_organise/service/contact_screen/contact_screen_service_model/contact_screen_service_model.dart';
import 'package:wedding_organise/service/messages/messages_service/messages_service.dart';

import '../../../core/enum/link_enum.dart';
import '../../../service/words/words_model/words_model.dart';
import '../../../service/words/words_service/words_service.dart';
part 'contact_us_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class ContactUsScreenModel = _ContactUsScreenModelBase
    with _$ContactUsScreenModel;

abstract class _ContactUsScreenModelBase with Store {
  @observable
  String textLoadError = 'Bir Hata Oluştu';
  @observable
  bool isLoading = false;
  @observable
  bool isChangeCard = true;
  @observable
  TextEditingController nameController = TextEditingController();
  @observable
  TextEditingController commentController = TextEditingController();
  @observable
  double latitude = 37.8560978;
  @observable
  double langtitude = 27.8057084;
  @observable
  double zoomCount = 16.0;
  @observable
  MapController mapController = MapController();
  @observable
  LatLng latLng = const LatLng(37.8560978, 27.8057084);

  @observable
  ContactInfoModel contactInfoModel = ContactInfoModel();
  final ContactInfoService _contactInfoService = ContactInfoService();
  @observable
  ContactScreenServiceModel contactScreenServiceModel =
      ContactScreenServiceModel();
  final ContactScreenService _contactScreenService = ContactScreenService();

  final MessagesService _messagesService = MessagesService();

  @observable
  WordsServiceModel words = WordsServiceModel();
  final WordsService _wordsService = WordsService();

  @action
  Future<void> initialize() async {
    await getTextStrings();
    contactInfoModel = await _contactInfoService.getContactInfo();
    await getScreenImageText().whenComplete(() => isLoading = true);

    //sonra sil
  }

  void checkChangeCard() {
    isChangeCard = !isChangeCard;
  }

  @action
  void zoomPlus() {
    if (zoomCount >= 20) return;
    zoomCount += 1.0;
    mapController.move(
        LatLng(contactInfoModel.adress!.latitude!.toDouble(),
            contactInfoModel.adress!.longtitude!.toDouble()),
        zoomCount);
  }

  @action
  void zoomMinus() {
    if (zoomCount <= 8) return;
    zoomCount -= 1.0;
    mapController.move(
        LatLng(contactInfoModel.adress!.latitude!.toDouble(),
            contactInfoModel.adress!.longtitude!.toDouble()),
        zoomCount);
  }

  @action
  Future<void> getScreenImageText() async {
    contactScreenServiceModel =
        await _contactScreenService.getContactScreenItems();
  }

  @action
  Future<void> getTextStrings() async {
    words = await _wordsService.getWords();
  }

  @action
  Future<void> getDirections({required BuildContext context}) async {
    final String directionGoogleMaps =
        'https://www.google.com/maps/dir/?api=1&destination=${contactInfoModel.adress?.latitude?.toString()},${contactInfoModel.adress?.longtitude?.toString()}';
    final String directionAppleMaps =
        'https://maps.apple.com/?daddr=${contactInfoModel.adress?.latitude?.toString()},${contactInfoModel.adress?.longtitude?.toString()}';

    if (await canLaunchUrlString(directionAppleMaps) &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS)) {
      await launchUrlString(directionAppleMaps);
    } else if (await canLaunchUrlString(directionGoogleMaps) &&
        (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.windows)) {
      await launchUrlString(directionGoogleMaps);
    } else {
      if (context.mounted) {
        context.snackBarExtension(
            content: 'Yol tarifi görüntülenirken bir problem oldu.');
      }

      return;
    }
  }

  @action
  Future<void> getCall({required BuildContext context}) async {
    final String url = 'tel:${contactInfoModel.phone}';
    if (await canLaunchUrlString(url) &&
        (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS)) {
      await launchUrlString(url);
    } else {
      if (context.mounted) {
        context.snackBarExtension(
            content: 'Yalnızca telefondan arama gerçekleştirebilirsiniz..');
      }
    }
  }

  @action
  Future<void> getWhatsapp({required BuildContext context}) async {
    final String url = contactInfoModel.whatsapp! + contactInfoModel.phone!;
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      if (context.mounted) {
        context.snackBarExtension(
            content:
                'Whatsapptan mesaj gönderme isteği ile ilgili bir hata oluştu');
      }
    }
  }

  @action
  Future<void> getInstagram() async {
    final String url = contactInfoModel.instagram!;
    await launchUrlString(url);
  }

  @action
  Future<void> getMail() async {
    final Uri uri = Uri(scheme: 'mailto', path: contactInfoModel.mail!);
    final String url = uri.toString();
    await launchUrlString(url);
  }

  @action
  Future<void> postMessage(
      {required String nameSurname,
      required String content,
      required BuildContext context}) async {
    await _messagesService
        .postMessages(nameSurname: nameSurname, content: content)
        .whenComplete(() {
      context.snackBarExtension(content: 'Mesajınız Başarıyla İletildi..');
      ContactUsScreen().navigateTo(context: context);
    });
  }
}
