// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_plan_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdminPlanScreenModel on _AdminPlanScreenModelBase, Store {
  late final _$isLoadingMainItemsAtom = Atom(
      name: '_AdminPlanScreenModelBase.isLoadingMainItems', context: context);

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

  late final _$isLoadingItemsAtom =
      Atom(name: '_AdminPlanScreenModelBase.isLoadingItems', context: context);

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

  late final _$textLoadErrorAtom =
      Atom(name: '_AdminPlanScreenModelBase.textLoadError', context: context);

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

  late final _$imageLoadErrorAtom =
      Atom(name: '_AdminPlanScreenModelBase.imageLoadError', context: context);

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
      name: '_AdminPlanScreenModelBase.updateTextController', context: context);

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
      name: '_AdminPlanScreenModelBase.updateImageController',
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

  late final _$itemsAtom =
      Atom(name: '_AdminPlanScreenModelBase.items', context: context);

  @override
  List<PlanDocuments> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<PlanDocuments> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$mainItemsAtom =
      Atom(name: '_AdminPlanScreenModelBase.mainItems', context: context);

  @override
  PlanSubModel get mainItems {
    _$mainItemsAtom.reportRead();
    return super.mainItems;
  }

  @override
  set mainItems(PlanSubModel value) {
    _$mainItemsAtom.reportWrite(value, super.mainItems, () {
      super.mainItems = value;
    });
  }

  late final _$imageDataAtom =
      Atom(name: '_AdminPlanScreenModelBase.imageData', context: context);

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
items: ${items},
mainItems: ${mainItems},
imageData: ${imageData}
    ''';
  }
}
