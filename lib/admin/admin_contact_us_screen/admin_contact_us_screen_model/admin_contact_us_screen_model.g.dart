// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_contact_us_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdminContactUsScreenModel on _AdminContactUsScreenModelBase, Store {
  late final _$textLoadErrorAtom = Atom(
      name: '_AdminContactUsScreenModelBase.textLoadError', context: context);

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

  late final _$imageLoadErrorAtom = Atom(
      name: '_AdminContactUsScreenModelBase.imageLoadError', context: context);

  @override
  String get imageLoadError {
    _$imageLoadErrorAtom.reportRead();
    return super.imageLoadError;
  }

  @override
  set imageLoadError(String value) {
    _$imageLoadErrorAtom.reportWrite(value, super.imageLoadError, () {
      super.imageLoadError = value;
    });
  }

  late final _$imageDataAtom =
      Atom(name: '_AdminContactUsScreenModelBase.imageData', context: context);

  @override
  String get imageData {
    _$imageDataAtom.reportRead();
    return super.imageData;
  }

  @override
  set imageData(String value) {
    _$imageDataAtom.reportWrite(value, super.imageData, () {
      super.imageData = value;
    });
  }

  late final _$isLoadingMainItemsAtom = Atom(
      name: '_AdminContactUsScreenModelBase.isLoadingMainItems',
      context: context);

  @override
  bool get isLoadingMainItems {
    _$isLoadingMainItemsAtom.reportRead();
    return super.isLoadingMainItems;
  }

  @override
  set isLoadingMainItems(bool value) {
    _$isLoadingMainItemsAtom.reportWrite(value, super.isLoadingMainItems, () {
      super.isLoadingMainItems = value;
    });
  }

  late final _$contactScreenServiceModelAtom = Atom(
      name: '_AdminContactUsScreenModelBase.contactScreenServiceModel',
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

  late final _$updateTextControllerAtom = Atom(
      name: '_AdminContactUsScreenModelBase.updateTextController',
      context: context);

  @override
  TextEditingController get updateTextController {
    _$updateTextControllerAtom.reportRead();
    return super.updateTextController;
  }

  @override
  set updateTextController(TextEditingController value) {
    _$updateTextControllerAtom.reportWrite(value, super.updateTextController,
        () {
      super.updateTextController = value;
    });
  }

  late final _$initializeAsyncAction = AsyncAction(
      '_AdminContactUsScreenModelBase.initialize',
      context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$getMainItemsAsyncAction = AsyncAction(
      '_AdminContactUsScreenModelBase.getMainItems',
      context: context);

  @override
  Future<void> getMainItems() {
    return _$getMainItemsAsyncAction.run(() => super.getMainItems());
  }

  late final _$updateTextAsyncAction = AsyncAction(
      '_AdminContactUsScreenModelBase.updateText',
      context: context);

  @override
  Future<void> updateText(
      {required String updateWord,
      required BuildContext context,
      required String link}) {
    return _$updateTextAsyncAction.run(() =>
        super.updateText(updateWord: updateWord, context: context, link: link));
  }

  late final _$updateImageFromWebFolderAsyncAction = AsyncAction(
      '_AdminContactUsScreenModelBase.updateImageFromWebFolder',
      context: context);

  @override
  Future<void> updateImageFromWebFolder({required BuildContext context}) {
    return _$updateImageFromWebFolderAsyncAction
        .run(() => super.updateImageFromWebFolder(context: context));
  }

  late final _$updateImageFromLinkAsyncAction = AsyncAction(
      '_AdminContactUsScreenModelBase.updateImageFromLink',
      context: context);

  @override
  Future<void> updateImageFromLink(
      {required String link, required BuildContext context}) {
    return _$updateImageFromLinkAsyncAction
        .run(() => super.updateImageFromLink(link: link, context: context));
  }

  @override
  String toString() {
    return '''
textLoadError: ${textLoadError},
imageLoadError: ${imageLoadError},
imageData: ${imageData},
isLoadingMainItems: ${isLoadingMainItems},
contactScreenServiceModel: ${contactScreenServiceModel},
updateTextController: ${updateTextController}
    ''';
  }
}
