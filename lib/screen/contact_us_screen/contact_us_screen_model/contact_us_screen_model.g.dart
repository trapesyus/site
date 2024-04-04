// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactUsScreenModel on _ContactUsScreenModelBase, Store {
  late final _$textLoadErrorAtom =
      Atom(name: '_ContactUsScreenModelBase.textLoadError', context: context);

  @override
  String get textLoadError {
    _$textLoadErrorAtom.reportRead();
    return super.textLoadError;
  }

  @override
  set textLoadError(String value) {
    _$textLoadErrorAtom.reportWrite(value, super.textLoadError, () {
      super.textLoadError = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ContactUsScreenModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isChangeCardAtom =
      Atom(name: '_ContactUsScreenModelBase.isChangeCard', context: context);

  @override
  bool get isChangeCard {
    _$isChangeCardAtom.reportRead();
    return super.isChangeCard;
  }

  @override
  set isChangeCard(bool value) {
    _$isChangeCardAtom.reportWrite(value, super.isChangeCard, () {
      super.isChangeCard = value;
    });
  }

  late final _$nameControllerAtom =
      Atom(name: '_ContactUsScreenModelBase.nameController', context: context);

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  late final _$commentControllerAtom = Atom(
      name: '_ContactUsScreenModelBase.commentController', context: context);

  @override
  TextEditingController get commentController {
    _$commentControllerAtom.reportRead();
    return super.commentController;
  }

  @override
  set commentController(TextEditingController value) {
    _$commentControllerAtom.reportWrite(value, super.commentController, () {
      super.commentController = value;
    });
  }

  late final _$latitudeAtom =
      Atom(name: '_ContactUsScreenModelBase.latitude', context: context);

  @override
  double get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(double value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  late final _$langtitudeAtom =
      Atom(name: '_ContactUsScreenModelBase.langtitude', context: context);

  @override
  double get langtitude {
    _$langtitudeAtom.reportRead();
    return super.langtitude;
  }

  @override
  set langtitude(double value) {
    _$langtitudeAtom.reportWrite(value, super.langtitude, () {
      super.langtitude = value;
    });
  }

  late final _$zoomCountAtom =
      Atom(name: '_ContactUsScreenModelBase.zoomCount', context: context);

  @override
  double get zoomCount {
    _$zoomCountAtom.reportRead();
    return super.zoomCount;
  }

  @override
  set zoomCount(double value) {
    _$zoomCountAtom.reportWrite(value, super.zoomCount, () {
      super.zoomCount = value;
    });
  }

  late final _$mapControllerAtom =
      Atom(name: '_ContactUsScreenModelBase.mapController', context: context);

  @override
  MapController get mapController {
    _$mapControllerAtom.reportRead();
    return super.mapController;
  }

  @override
  set mapController(MapController value) {
    _$mapControllerAtom.reportWrite(value, super.mapController, () {
      super.mapController = value;
    });
  }

  late final _$latLngAtom =
      Atom(name: '_ContactUsScreenModelBase.latLng', context: context);

  @override
  LatLng get latLng {
    _$latLngAtom.reportRead();
    return super.latLng;
  }

  @override
  set latLng(LatLng value) {
    _$latLngAtom.reportWrite(value, super.latLng, () {
      super.latLng = value;
    });
  }

  late final _$contactInfoModelAtom = Atom(
      name: '_ContactUsScreenModelBase.contactInfoModel', context: context);

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

  late final _$contactScreenServiceModelAtom = Atom(
      name: '_ContactUsScreenModelBase.contactScreenServiceModel',
      context: context);

  @override
  ContactScreenServiceModel get contactScreenServiceModel {
    _$contactScreenServiceModelAtom.reportRead();
    return super.contactScreenServiceModel;
  }

  @override
  set contactScreenServiceModel(ContactScreenServiceModel value) {
    _$contactScreenServiceModelAtom
        .reportWrite(value, super.contactScreenServiceModel, () {
      super.contactScreenServiceModel = value;
    });
  }

  late final _$wordsAtom =
      Atom(name: '_ContactUsScreenModelBase.words', context: context);

  @override
  WordsServiceModel get words {
    _$wordsAtom.reportRead();
    return super.words;
  }

  @override
  set words(WordsServiceModel value) {
    _$wordsAtom.reportWrite(value, super.words, () {
      super.words = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_ContactUsScreenModelBase.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$getScreenImageTextAsyncAction = AsyncAction(
      '_ContactUsScreenModelBase.getScreenImageText',
      context: context);

  @override
  Future<void> getScreenImageText() {
    return _$getScreenImageTextAsyncAction
        .run(() => super.getScreenImageText());
  }

  late final _$getTextStringsAsyncAction =
      AsyncAction('_ContactUsScreenModelBase.getTextStrings', context: context);

  @override
  Future<void> getTextStrings() {
    return _$getTextStringsAsyncAction.run(() => super.getTextStrings());
  }

  late final _$getDirectionsAsyncAction =
      AsyncAction('_ContactUsScreenModelBase.getDirections', context: context);

  @override
  Future<void> getDirections({required BuildContext context}) {
    return _$getDirectionsAsyncAction
        .run(() => super.getDirections(context: context));
  }

  late final _$getCallAsyncAction =
      AsyncAction('_ContactUsScreenModelBase.getCall', context: context);

  @override
  Future<void> getCall({required BuildContext context}) {
    return _$getCallAsyncAction.run(() => super.getCall(context: context));
  }

  late final _$getWhatsappAsyncAction =
      AsyncAction('_ContactUsScreenModelBase.getWhatsapp', context: context);

  @override
  Future<void> getWhatsapp({required BuildContext context}) {
    return _$getWhatsappAsyncAction
        .run(() => super.getWhatsapp(context: context));
  }

  late final _$getInstagramAsyncAction =
      AsyncAction('_ContactUsScreenModelBase.getInstagram', context: context);

  @override
  Future<void> getInstagram() {
    return _$getInstagramAsyncAction.run(() => super.getInstagram());
  }

  late final _$getMailAsyncAction =
      AsyncAction('_ContactUsScreenModelBase.getMail', context: context);

  @override
  Future<void> getMail() {
    return _$getMailAsyncAction.run(() => super.getMail());
  }

  late final _$postMessageAsyncAction =
      AsyncAction('_ContactUsScreenModelBase.postMessage', context: context);

  @override
  Future<void> postMessage(
      {required String nameSurname,
      required String content,
      required BuildContext context}) {
    return _$postMessageAsyncAction.run(() => super.postMessage(
        nameSurname: nameSurname, content: content, context: context));
  }

  late final _$_ContactUsScreenModelBaseActionController =
      ActionController(name: '_ContactUsScreenModelBase', context: context);

  @override
  void zoomPlus() {
    final _$actionInfo = _$_ContactUsScreenModelBaseActionController
        .startAction(name: '_ContactUsScreenModelBase.zoomPlus');
    try {
      return super.zoomPlus();
    } finally {
      _$_ContactUsScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void zoomMinus() {
    final _$actionInfo = _$_ContactUsScreenModelBaseActionController
        .startAction(name: '_ContactUsScreenModelBase.zoomMinus');
    try {
      return super.zoomMinus();
    } finally {
      _$_ContactUsScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textLoadError: ${textLoadError},
isLoading: ${isLoading},
isChangeCard: ${isChangeCard},
nameController: ${nameController},
commentController: ${commentController},
latitude: ${latitude},
langtitude: ${langtitude},
zoomCount: ${zoomCount},
mapController: ${mapController},
latLng: ${latLng},
contactInfoModel: ${contactInfoModel},
contactScreenServiceModel: ${contactScreenServiceModel},
words: ${words}
    ''';
  }
}
