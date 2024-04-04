// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdminScreenModel on _AdminScreenModelBase, Store {
  late final _$isWordLoadingAtom =
      Atom(name: '_AdminScreenModelBase.isWordLoading', context: context);

  @override
  bool get isWordLoading {
    _$isWordLoadingAtom.reportRead();
    return super.isWordLoading;
  }

  @override
  set isWordLoading(bool value) {
    _$isWordLoadingAtom.reportWrite(value, super.isWordLoading, () {
      super.isWordLoading = value;
    });
  }

  late final _$buttonPathControllerAtom = Atom(
      name: '_AdminScreenModelBase.buttonPathController', context: context);

  @override
  TextEditingController get buttonPathController {
    _$buttonPathControllerAtom.reportRead();
    return super.buttonPathController;
  }

  @override
  set buttonPathController(TextEditingController value) {
    _$buttonPathControllerAtom.reportWrite(value, super.buttonPathController,
        () {
      super.buttonPathController = value;
    });
  }

  late final _$contactInfoModelAtom =
      Atom(name: '_AdminScreenModelBase.contactInfoModel', context: context);

  @override
  ContactInfoModel get contactInfoModel {
    _$contactInfoModelAtom.reportRead();
    return super.contactInfoModel;
  }

  @override
  set contactInfoModel(ContactInfoModel value) {
    _$contactInfoModelAtom.reportWrite(value, super.contactInfoModel, () {
      super.contactInfoModel = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_AdminScreenModelBase.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$patchInstagramAsyncAction =
      AsyncAction('_AdminScreenModelBase.patchInstagram', context: context);

  @override
  Future<void> patchInstagram(
      {required String patchLink, required BuildContext context}) {
    return _$patchInstagramAsyncAction.run(
        () => super.patchInstagram(patchLink: patchLink, context: context));
  }

  late final _$patchPhoneAsyncAction =
      AsyncAction('_AdminScreenModelBase.patchPhone', context: context);

  @override
  Future<void> patchPhone(
      {required String patchLink, required BuildContext context}) {
    return _$patchPhoneAsyncAction
        .run(() => super.patchPhone(patchLink: patchLink, context: context));
  }

  late final _$patchFacebookAsyncAction =
      AsyncAction('_AdminScreenModelBase.patchFacebook', context: context);

  @override
  Future<void> patchFacebook(
      {required String patchLink, required BuildContext context}) {
    return _$patchFacebookAsyncAction
        .run(() => super.patchFacebook(patchLink: patchLink, context: context));
  }

  late final _$patchXAsyncAction =
      AsyncAction('_AdminScreenModelBase.patchX', context: context);

  @override
  Future<void> patchX(
      {required String patchLink, required BuildContext context}) {
    return _$patchXAsyncAction
        .run(() => super.patchX(patchLink: patchLink, context: context));
  }

  late final _$patchMailAsyncAction =
      AsyncAction('_AdminScreenModelBase.patchMail', context: context);

  @override
  Future<void> patchMail(
      {required String patchLink, required BuildContext context}) {
    return _$patchMailAsyncAction
        .run(() => super.patchMail(patchLink: patchLink, context: context));
  }

  late final _$patchAdressLatitudeAsyncAction = AsyncAction(
      '_AdminScreenModelBase.patchAdressLatitude',
      context: context);

  @override
  Future<void> patchAdressLatitude(
      {required double patchAdressLatitude, required BuildContext context}) {
    return _$patchAdressLatitudeAsyncAction.run(() => super.patchAdressLatitude(
        patchAdressLatitude: patchAdressLatitude, context: context));
  }

  late final _$patchAdressLongtitudeAsyncAction = AsyncAction(
      '_AdminScreenModelBase.patchAdressLongtitude',
      context: context);

  @override
  Future<void> patchAdressLongtitude(
      {required double patchAdressLongtitude, required BuildContext context}) {
    return _$patchAdressLongtitudeAsyncAction.run(() => super
        .patchAdressLongtitude(
            patchAdressLongtitude: patchAdressLongtitude, context: context));
  }

  @override
  String toString() {
    return '''
isWordLoading: ${isWordLoading},
buttonPathController: ${buttonPathController},
contactInfoModel: ${contactInfoModel}
    ''';
  }
}
