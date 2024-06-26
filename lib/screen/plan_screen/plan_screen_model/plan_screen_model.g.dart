// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlanScreenModel on _PlanScreenModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PlanScreenModelBase.isLoading', context: context);

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

  late final _$imageLoadErrorAtom =
      Atom(name: '_PlanScreenModelBase.imageLoadError', context: context);

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

  late final _$textLoadErrorAtom =
      Atom(name: '_PlanScreenModelBase.textLoadError', context: context);

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

  late final _$mainImageAtom =
      Atom(name: '_PlanScreenModelBase.mainImage', context: context);

  @override
  String get mainImage {
    _$mainImageAtom.reportRead();
    return super.mainImage;
  }

  @override
  set mainImage(String value) {
    _$mainImageAtom.reportWrite(value, super.mainImage, () {
      super.mainImage = value;
    });
  }

  late final _$itemsAtom =
      Atom(name: '_PlanScreenModelBase.items', context: context);

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
      Atom(name: '_PlanScreenModelBase.mainItems', context: context);

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

  late final _$initializeAsyncAction =
      AsyncAction('_PlanScreenModelBase.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
imageLoadError: ${imageLoadError},
textLoadError: ${textLoadError},
mainImage: ${mainImage},
items: ${items},
mainItems: ${mainItems}
    ''';
  }
}
