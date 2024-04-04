import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_contact_us_screen/admin_contact_us_screen.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/snackbar_extension.dart';
import 'package:wedding_organise/service/contact_screen/contact_screen_service/contact_screen_service.dart';
import 'package:wedding_organise/service/contact_screen/contact_screen_service_model/contact_screen_service_model.dart';

import '../../../core/enum/url_enum.dart';
part 'admin_contact_us_screen_model.g.dart';

class AdminContactUsScreenModel = _AdminContactUsScreenModelBase
    with _$AdminContactUsScreenModel;

abstract class _AdminContactUsScreenModelBase with Store {
  @observable
  String textLoadError = 'Bir Hata Oluştu';
  @observable
  String imageLoadError = 'https://wallpaperaccess.com/full/4624260.jpg';

  @observable
  String imageData = '';
  @observable
  bool isLoadingMainItems = false;
  @observable
  ContactScreenServiceModel contactScreenServiceModel =
      ContactScreenServiceModel();
  final ContactScreenService _contactScreenService = ContactScreenService();
  @observable
  TextEditingController updateTextController = TextEditingController();
  @action
  Future<void> initialize() async {
    await getMainItems().whenComplete(() {
      isLoadingMainItems = true;
    });
  }

  @action
  Future<void> getMainItems() async {
    contactScreenServiceModel =
        (await _contactScreenService.getContactScreenItems());
  }

  @action
  Future<void> updateText(
      {required String updateWord,
      required BuildContext context,
      required String link}) async {
    if (updateWord == '') {
      context.snackBarExtension(content: 'Güncellemek için yazı girin');
      return;
    }

    _contactScreenService
        .patchContactScreenText(text: updateWord)
        .whenComplete(() {
      if (context.mounted) {
        context.snackBarExtension(content: 'Başarıyla Güncellendi');
        AdminContactUsScreen().navigateToPushReplacement(context: context);
      }
    });
  }

  @action
  Future<void> updateImageFromWebFolder({required BuildContext context}) async {
    if (imageData.contains('https://')) return;
    Uint8List? fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker == null) return;
    imageData = base64Encode(fromPicker);

    await _contactScreenService
        .patchContactScreenImage(image: imageData)
        .whenComplete(() {
      if (context.mounted) {
        context.snackBarExtension(content: 'Başarıyla Güncellendi');
        AdminContactUsScreen().navigateToPushReplacement(context: context);
      }
    });
  }

  @action
  Future<void> updateImageFromLink({
    required String link,
    required BuildContext context,
  }) async {
    await _contactScreenService
        .patchContactScreenImage(image: link)
        .whenComplete(() {
      if (context.mounted) {
        context.snackBarExtension(content: 'Başarıyla Güncellendi');
        AdminContactUsScreen().navigateToPushReplacement(context: context);
      }
    });
  }
}
