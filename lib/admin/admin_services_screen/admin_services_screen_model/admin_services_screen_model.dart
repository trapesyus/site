import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_services_screen/admin_services_screen.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/snackbar_extension.dart';

import 'package:wedding_organise/service/service_screen/service_model/service_submodel/service_submodel/service_sub_model.dart';
import 'package:wedding_organise/service/service_screen/service_service/service_service.dart';
import 'package:wedding_organise/service/service_screen/service_service/service_subservice/service_sub_service.dart';

import '../../../service/service_screen/service_model/service_service_model.dart';
part 'admin_services_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class AdminServicesScreenModel = _AdminServicesScreenModelBase
    with _$AdminServicesScreenModel;

abstract class _AdminServicesScreenModelBase with Store {
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
  TextEditingController updateContentController = TextEditingController();

  @observable
  List<ServiceDocuments> items = ObservableList.of([]);
  final ServiceService _serviceService = ServiceService();

  @observable
  ServiceSubModel mainItems = ServiceSubModel();
  final ServiceSubService _serviceSubService = ServiceSubService();

  @observable
  String imageData = '';
  Future<void> initialize() async {
    await getMainItems().whenComplete(() => isLoadingMainItems = true);
    await getItems().whenComplete(() => isLoadingItems = true);
  }

  Future<void> getMainItems() async {
    mainItems = (await _serviceSubService.getServicesScreenMainImageText())!;
  }

  Future<void> getItems() async {
    items = (await _serviceService.getServiceScreenItems())!;
  }

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
    if (link == UrlEnum.urlServicesScreenMainImageText.url) {
      _serviceSubService
          .patchServicesScreenMainText(text: updateWord)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminServicesScreen().navigateToPushReplacement(context: context);
        }
      });
    } else {
      await _serviceSubService
          .patchServicesScreenItems(
              link: link, text: updateWord, image: image, content: content)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminServicesScreen().navigateToPushReplacement(context: context);
        }
      });
    }
  }

  Future<void> updateImageFromWebFolder(
      {required BuildContext context,
      required String url,
      required String content,
      required String text}) async {
    if (imageData.contains('https://')) return;
    Uint8List? fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker == null) return;
    imageData = base64Encode(fromPicker);
    log(url);

    if (url == UrlEnum.urlServicesScreenMainImageText.url) {
      await _serviceSubService
          .patchgetServicesScreenMainImage(image: imageData)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminServicesScreen().navigateToPushReplacement(context: context);
        }
      });
    } else {
      await _serviceSubService
          .patchServicesScreenItems(
              image: imageData, link: url, text: text, content: content)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminServicesScreen().navigateToPushReplacement(context: context);
        }
      });
    }
  }

  Future<void> updateImageFromLink(
      {required String link,
      required BuildContext context,
      required String content,
      required String text,
      required String patchUrl}) async {
    if (patchUrl == UrlEnum.urlServicesScreenMainImageText.url) {
      await _serviceSubService
          .patchgetServicesScreenMainImage(image: link)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminServicesScreen().navigateToPushReplacement(context: context);
        }
      });
    } else {
      await _serviceSubService
          .patchServicesScreenItems(
              image: link, link: patchUrl, text: text, content: content)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminServicesScreen().navigateToPushReplacement(context: context);
        }
      });
    }
  }

  Future<void> postServicesScreenItems(
      {required BuildContext context,
      required String content,
      required String imageUrl,
      required String text}) async {
    if (text == '') {
      context.snackBarExtension(content: 'Metin Alanı Boş Olamaz');
      return;
    }

    if (imageUrl.contains('https://')) {
      await _serviceSubService
          .postServicesScreenItems(
              image: imageUrl, text: text, content: content)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Yeni Hizmet Başarıyla Eklendi.');
          AdminServicesScreen().navigateToPushReplacement(context: context);
        }
      });
    } else if (!imageUrl.contains('https://')) {
      Uint8List? fromPicker = await ImagePickerWeb.getImageAsBytes();
      if (fromPicker == null) return;
      imageData = base64Encode(fromPicker);
      await _serviceSubService
          .postServicesScreenItems(
              image: imageData, text: text, content: content)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Yeni Hizmet Başarıyla Eklendi.');
          AdminServicesScreen().navigateToPushReplacement(context: context);
        }
      });
    } else if (imageUrl == '') {
      context.snackBarExtension(content: 'Resim urlsi boş olamaz');
      return;
    }
  }

  Future<void> deleteServicesScreenItems(
      {required String link, required BuildContext context}) async {
    await _serviceSubService
        .deleteServicesScreenItems(url: link)
        .whenComplete(() {
      if (context.mounted) {
        context.snackBarExtension(
            content: 'Silme İşlemi Başarıyla Gerçekleştirildi');
        AdminServicesScreen().navigateToPushReplacement(context: context);
      }
    });
  }
}
