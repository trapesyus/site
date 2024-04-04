// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$cardSizeColorCheckAtom =
      Atom(name: '_HomeScreenModelBase.cardSizeColorCheck', context: context);

  @override
  bool get cardSizeColorCheck {
    _$cardSizeColorCheckAtom.reportRead();
    return super.cardSizeColorCheck;
  }

  @override
  set cardSizeColorCheck(bool value) {
    _$cardSizeColorCheckAtom.reportWrite(value, super.cardSizeColorCheck, () {
      super.cardSizeColorCheck = value;
    });
  }

  late final _$isLoadingTextAtom =
      Atom(name: '_HomeScreenModelBase.isLoadingText', context: context);

  @override
  bool get isLoadingText {
    _$isLoadingTextAtom.reportRead();
    return super.isLoadingText;
  }

  @override
  set isLoadingText(bool value) {
    _$isLoadingTextAtom.reportWrite(value, super.isLoadingText, () {
      super.isLoadingText = value;
    });
  }

  late final _$isLoadingImageAtom =
      Atom(name: '_HomeScreenModelBase.isLoadingImage', context: context);

  @override
  bool get isLoadingImage {
    _$isLoadingImageAtom.reportRead();
    return super.isLoadingImage;
  }

  @override
  set isLoadingImage(bool value) {
    _$isLoadingImageAtom.reportWrite(value, super.isLoadingImage, () {
      super.isLoadingImage = value;
    });
  }

  late final _$isLoadingJobsAtom =
      Atom(name: '_HomeScreenModelBase.isLoadingJobs', context: context);

  @override
  bool get isLoadingJobs {
    _$isLoadingJobsAtom.reportRead();
    return super.isLoadingJobs;
  }

  @override
  set isLoadingJobs(bool value) {
    _$isLoadingJobsAtom.reportWrite(value, super.isLoadingJobs, () {
      super.isLoadingJobs = value;
    });
  }

  late final _$isLoadingMessagesAtom =
      Atom(name: '_HomeScreenModelBase.isLoadingMessages', context: context);

  @override
  bool get isLoadingMessages {
    _$isLoadingMessagesAtom.reportRead();
    return super.isLoadingMessages;
  }

  @override
  set isLoadingMessages(bool value) {
    _$isLoadingMessagesAtom.reportWrite(value, super.isLoadingMessages, () {
      super.isLoadingMessages = value;
    });
  }

  late final _$jobsAtom =
      Atom(name: '_HomeScreenModelBase.jobs', context: context);

  @override
  List<Documents> get jobs {
    _$jobsAtom.reportRead();
    return super.jobs;
  }

  @override
  set jobs(List<Documents> value) {
    _$jobsAtom.reportWrite(value, super.jobs, () {
      super.jobs = value;
    });
  }

  late final _$messagesAtom =
      Atom(name: '_HomeScreenModelBase.messages', context: context);

  @override
  List<DocumentsMessages> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(List<DocumentsMessages> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$wordsAtom =
      Atom(name: '_HomeScreenModelBase.words', context: context);

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

  late final _$imagesAtom =
      Atom(name: '_HomeScreenModelBase.images', context: context);

  @override
  ImageServiceModel get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ImageServiceModel value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  late final _$scrollControllerAtom =
      Atom(name: '_HomeScreenModelBase.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$_HomeScreenModelBaseActionController =
      ActionController(name: '_HomeScreenModelBase', context: context);

  @override
  void cardSizeColorChecker() {
    final _$actionInfo = _$_HomeScreenModelBaseActionController.startAction(
        name: '_HomeScreenModelBase.cardSizeColorChecker');
    try {
      return super.cardSizeColorChecker();
    } finally {
      _$_HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardSizeColorCheck: ${cardSizeColorCheck},
isLoadingText: ${isLoadingText},
isLoadingImage: ${isLoadingImage},
isLoadingJobs: ${isLoadingJobs},
isLoadingMessages: ${isLoadingMessages},
jobs: ${jobs},
messages: ${messages},
words: ${words},
images: ${images},
scrollController: ${scrollController}
    ''';
  }
}
