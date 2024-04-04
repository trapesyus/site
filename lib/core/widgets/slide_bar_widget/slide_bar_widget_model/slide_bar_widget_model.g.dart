// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide_bar_widget_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomSlideBarWidgetModel on _CustomSlideBarWidgetModelBase, Store {
  late final _$contactInfoModelAtom = Atom(
      name: '_CustomSlideBarWidgetModelBase.contactInfoModel',
      context: context);

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

  late final _$getContactInfoAsyncAction = AsyncAction(
      '_CustomSlideBarWidgetModelBase.getContactInfo',
      context: context);

  @override
  Future<void> getContactInfo() {
    return _$getContactInfoAsyncAction.run(() => super.getContactInfo());
  }

  late final _$getCallAsyncAction =
      AsyncAction('_CustomSlideBarWidgetModelBase.getCall', context: context);

  @override
  Future<void> getCall({required BuildContext context}) {
    return _$getCallAsyncAction.run(() => super.getCall(context: context));
  }

  late final _$getWhatsappAsyncAction = AsyncAction(
      '_CustomSlideBarWidgetModelBase.getWhatsapp',
      context: context);

  @override
  Future<void> getWhatsapp({required BuildContext context}) {
    return _$getWhatsappAsyncAction
        .run(() => super.getWhatsapp(context: context));
  }

  late final _$getInstagramAsyncAction = AsyncAction(
      '_CustomSlideBarWidgetModelBase.getInstagram',
      context: context);

  @override
  Future<void> getInstagram() {
    return _$getInstagramAsyncAction.run(() => super.getInstagram());
  }

  late final _$getMailAsyncAction =
      AsyncAction('_CustomSlideBarWidgetModelBase.getMail', context: context);

  @override
  Future<void> getMail() {
    return _$getMailAsyncAction.run(() => super.getMail());
  }

  @override
  String toString() {
    return '''
contactInfoModel: ${contactInfoModel}
    ''';
  }
}
