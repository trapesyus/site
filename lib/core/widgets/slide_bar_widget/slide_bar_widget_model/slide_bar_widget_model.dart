import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wedding_organise/core/extensions/snackbar_extension.dart';
import 'package:wedding_organise/service/contact_info/contact_info_model/contact_info_model.dart';
import 'package:wedding_organise/service/contact_info/contact_info_service/contact_info_service.dart';

import '../../../enum/link_enum.dart';
part 'slide_bar_widget_model.g.dart';

// ignore: library_private_types_in_public_api
class CustomSlideBarWidgetModel = _CustomSlideBarWidgetModelBase
    with _$CustomSlideBarWidgetModel;

abstract class _CustomSlideBarWidgetModelBase with Store {
  @observable
  ContactInfoModel contactInfoModel = ContactInfoModel();
  final ContactInfoService _contactInfoService = ContactInfoService();

  Future<void> initialize() async {
    await getContactInfo();
  }

  @action
  Future<void> getContactInfo() async {
    contactInfoModel = await _contactInfoService.getContactInfo();
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
    final String url = LinkEnum.instagramLink.link;
    await launchUrlString(url);
  }

  @action
  Future<void> getMail() async {
    final Uri uri = Uri(scheme: 'mailto', path: contactInfoModel.mail!);
    final String url = uri.toString();
    await launchUrlString(url);
  }
}
