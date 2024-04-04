import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_screen/admin_screen.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/snackbar_extension.dart';
import 'package:wedding_organise/service/contact_info/contact_info_model/contact_info_model.dart';
import 'package:wedding_organise/service/contact_info/contact_info_service/contact_info_service.dart';
part 'admin_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class AdminScreenModel = _AdminScreenModelBase with _$AdminScreenModel;

abstract class _AdminScreenModelBase with Store {
  @observable
  bool isWordLoading = false;

  @observable
  TextEditingController buttonPathController = TextEditingController();

  @observable
  ContactInfoModel contactInfoModel = ContactInfoModel();
  final ContactInfoService _contactInfoService = ContactInfoService();
  @action
  Future<void> initialize() async {
    await getButtonInfo().whenComplete(() => isWordLoading = true);
  }

  Future<void> getButtonInfo() async {
    contactInfoModel = await _contactInfoService.getContactInfo();
  }

  @action
  Future<void> patchInstagram(
      {required String patchLink, required BuildContext context}) async {
    if (!patchLink.contains('https://')) {
      context.snackBarExtension(
          content:
              'Instagram linkini güncellemek için lütfen geçerli bir link girin');
      return;
    }
    await _contactInfoService.patchInstagram(patchLink: patchLink).whenComplete(
        () => AdminScreen().navigateToPushReplacement(context: context));
  }

  @action
  Future<void> patchPhone(
      {required String patchLink, required BuildContext context}) async {
    await _contactInfoService.patchPhone(patchLink: patchLink).whenComplete(
        () => AdminScreen().navigateToPushReplacement(context: context));
  }

  @action
  Future<void> patchFacebook(
      {required String patchLink, required BuildContext context}) async {
    if (!patchLink.contains('https://')) {
      context.snackBarExtension(
          content:
              'Facebook linkini güncellemek için lütfen geçerli bir link girin');
      return;
    }
    await _contactInfoService.patchFacebook(patchLink: patchLink).whenComplete(
        () => AdminScreen().navigateToPushReplacement(context: context));
  }

  @action
  Future<void> patchX(
      {required String patchLink, required BuildContext context}) async {
    if (!patchLink.contains('https://')) {
      context.snackBarExtension(
          content: 'X linkini güncellemek için lütfen geçerli bir link girin');
      return;
    }
    await _contactInfoService.patchX(patchLink: patchLink).whenComplete(
        () => AdminScreen().navigateToPushReplacement(context: context));
  }

  @action
  Future<void> patchMail(
      {required String patchLink, required BuildContext context}) async {
    if (!patchLink.contains('@')) {
      context.snackBarExtension(
          content:
              'Mail linkini güncellemek için lütfen geçerli bir mail adresi girin');
      return;
    }
    await _contactInfoService.patchMail(patchLink: patchLink).whenComplete(
        () => AdminScreen().navigateToPushReplacement(context: context));
  }

  @action
  Future<void> patchAdressLatitude(
      {required double patchAdressLatitude,
      required BuildContext context}) async {
    await _contactInfoService
        .patchAdressLatitude(patchLatitude: patchAdressLatitude)
        .whenComplete(
            () => AdminScreen().navigateToPushReplacement(context: context));
  }

  @action
  Future<void> patchAdressLongtitude(
      {required double patchAdressLongtitude,
      required BuildContext context}) async {
    await _contactInfoService
        .patchAdressLatitude(patchLatitude: patchAdressLongtitude)
        .whenComplete(
            () => AdminScreen().navigateToPushReplacement(context: context));
  }
}
