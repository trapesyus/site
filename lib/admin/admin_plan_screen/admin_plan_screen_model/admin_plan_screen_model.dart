import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_plan_screen/admin_plan_screen.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/snackbar_extension.dart';
import 'package:wedding_organise/service/plan/plan_model/plan_service_model.dart';
import 'package:wedding_organise/service/plan/plan_model/plan_submodel/plan_sub_model.dart';
import 'package:wedding_organise/service/plan/plan_service/plan_service.dart';
import 'package:wedding_organise/service/plan/plan_service/plan_sub_service/plan_sub_service.dart';
part 'admin_plan_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class AdminPlanScreenModel = _AdminPlanScreenModelBase
    with _$AdminPlanScreenModel;

abstract class _AdminPlanScreenModelBase with Store {
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
  List<PlanDocuments> items = ObservableList.of([]);
  final PlanService _planService = PlanService();

  @observable
  PlanSubModel mainItems = PlanSubModel();
  final PlanSubService _planSubService = PlanSubService();

  @observable
  String imageData = '';
  Future<void> initialize() async {
    await getMainItems().whenComplete(() => isLoadingMainItems = true);
    await getItems().whenComplete(() => isLoadingItems = true);
  }

  Future<void> getMainItems() async {
    mainItems = (await _planSubService.getPlanScreenMainImageText())!;
  }

  Future<void> getItems() async {
    items = (await _planService.getPlanScreenItems())!;
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
    if (link == UrlEnum.urlPlanScreenMainImageText.url) {
      _planSubService
          .patchPlanScreenMainText(text: updateWord)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminPlanScreen().navigateToPushReplacement(context: context);
        }
      });
    } else {
      await _planSubService
          .patchPlanScreenItems(
              link: link, text: updateWord, image: image, content: content)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminPlanScreen().navigateToPushReplacement(context: context);
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

    if (url == UrlEnum.urlPlanScreenMainImageText.url) {
      await _planSubService
          .patchPlanScreenMainImage(image: imageData)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminPlanScreen().navigateToPushReplacement(context: context);
        }
      });
    } else {
      await _planSubService
          .patchPlanScreenItems(
              image: imageData, link: url, text: text, content: content)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminPlanScreen().navigateToPushReplacement(context: context);
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
    if (patchUrl == UrlEnum.urlPlanScreenMainImageText.url) {
      await _planSubService
          .patchPlanScreenMainImage(image: link)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminPlanScreen().navigateToPushReplacement(context: context);
        }
      });
    } else {
      await _planSubService
          .patchPlanScreenItems(
              image: link, link: patchUrl, text: text, content: content)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Başarıyla Güncellendi');
          AdminPlanScreen().navigateToPushReplacement(context: context);
        }
      });
    }
  }

  Future<void> postPlanScreenItems(
      {required BuildContext context,
      required String imageUrl,
      required String text}) async {
    if (text == '') {
      context.snackBarExtension(content: 'Metin Alanı Boş Olamaz');
      return;
    }

    if (imageUrl.contains('https://')) {
      await _planSubService
          .postPlanScreenItems(image: imageUrl, text: text)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Yeni Plan Başarıyla Eklendi.');
          AdminPlanScreen().navigateToPushReplacement(context: context);
        }
      });
    } else if (!imageUrl.contains('https://')) {
      Uint8List? fromPicker = await ImagePickerWeb.getImageAsBytes();
      if (fromPicker == null) return;
      imageData = base64Encode(fromPicker);
      await _planSubService
          .postPlanScreenItems(image: imageData, text: text)
          .whenComplete(() {
        if (context.mounted) {
          context.snackBarExtension(content: 'Yeni Plan Başarıyla Eklendi.');
          AdminPlanScreen().navigateToPushReplacement(context: context);
        }
      });
    } else if (imageUrl == '') {
      context.snackBarExtension(content: 'Resim urlsi boş olamaz');
      return;
    }
  }

  Future<void> deletePlanScreenItems(
      {required String link, required BuildContext context}) async {
    await _planSubService.deletePlanScreenItems(url: link).whenComplete(() {
      if (context.mounted) {
        context.snackBarExtension(
            content: 'Silme İşlemi Başarıyla Gerçekleştirildi');
        AdminPlanScreen().navigateToPushReplacement(context: context);
      }
    });
  }
}
