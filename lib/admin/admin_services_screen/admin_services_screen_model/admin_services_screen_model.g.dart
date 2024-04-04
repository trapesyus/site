// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_services_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdminServicesScreenModel on _AdminServicesScreenModelBase, Store {
  late final _$isLoadingMainItemsAtom = Atom(
      name: '_AdminServicesScreenModelBase.isLoadingMainItems',
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

  late final _$isLoadingItemsAtom = Atom(
      name: '_AdminServicesScreenModelBase.isLoadingItems', context: context);

  @override
  bool get isLoadingItems {
    _$isLoadingItemsAtom.reportRead();
    return super.isLoadingItems;
  }

  @override
  set isLoadingItems(bool value) {
    _$isLoadingItemsAtom.reportWrite(value, super.isLoadingItems, () {
      super.isLoadingItems = value;
    });
  }

  late final _$textLoadErrorAtom = Atom(
      name: '_AdminServicesScreenModelBase.textLoadError', context: context);

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
      name: '_AdminServicesScreenModelBase.imageLoadError', context: context);

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

  late final _$updateTextControllerAtom = Atom(
      name: '_AdminServicesScreenModelBase.updateTextController',
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

  late final _$updateImageControllerAtom = Atom(
      name: '_AdminServicesScreenModelBase.updateImageController',
      context: context);

  @override
  TextEditingController get updateImageController {
    _$updateImageControllerAtom.reportRead();
    return super.updateImageController;
  }

  @override
  set updateImageController(TextEditingController value) {
    _$updateImageControllerAtom.reportWrite(value, super.updateImageController,
        () {
      super.updateImageController = value;
    });
  }

  late final _$updateContentControllerAtom = Atom(
      name: '_AdminServicesScreenModelBase.updateContentController',
      context: context);

  @override
  TextEditingController get updateContentController {
    _$updateContentControllerAtom.reportRead();
    return super.updateContentController;
  }

  @override
  set updateContentController(TextEditingController value) {
    _$updateContentControllerAtom
        .reportWrite(value, super.updateContentController, () {
      super.updateContentController = value;
    });
  }

  late final _$itemsAtom =
      Atom(name: '_AdminServicesScreenModelBase.items', context: context);

  @override
  List<ServiceDocuments> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<ServiceDocuments> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$mainItemsAtom =
      Atom(name: '_AdminServicesScreenModelBase.mainItems', context: context);

  @override
  ServiceSubModel get mainItems {
    _$mainItemsAtom.reportRead();
    return super.mainItems;
  }

  @override
  set mainItems(ServiceSubModel value) {
    _$mainItemsAtom.reportWrite(value, super.mainItems, () {
      super.mainItems = value;
    });
  }

  late final _$imageDataAtom =
      Atom(name: '_AdminServicesScreenModelBase.imageData', context: context);

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

  @override
  String toString() {
    return '''
isLoadingMainItems: ${isLoadingMainItems},
isLoadingItems: ${isLoadingItems},
textLoadError: ${textLoadError},
imageLoadError: ${imageLoadError},
updateTextController: ${updateTextController},
updateImageController: ${updateImageController},
updateContentController: ${updateContentController},
items: ${items},
mainItems: ${mainItems},
imageData: ${imageData}
    ''';
  }
}
