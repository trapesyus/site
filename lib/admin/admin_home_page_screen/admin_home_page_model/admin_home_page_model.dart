import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_home_page_screen/admin_home_page_screen.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/snackbar_extension.dart';

import 'package:wedding_organise/service/images/images_home_screen/images_home_screen_model/images_home_screen_model.dart';
import 'package:wedding_organise/service/images/images_home_screen/images_home_screen_service/images_home_screen_service.dart';
import 'package:wedding_organise/service/jobs/jobs_model/jobs_model.dart';
import 'package:wedding_organise/service/jobs/jobs_service/jobs_service.dart';
import 'package:wedding_organise/service/messages/messages_model/messages_service_model.dart';
import 'package:wedding_organise/service/messages/messages_service/messages_service.dart';
import 'package:wedding_organise/service/words/words_model/words_model.dart';
import 'package:wedding_organise/service/words/words_service/words_service.dart';
part 'admin_home_page_model.g.dart';

// ignore: library_private_types_in_public_api
class AdminHomePageScreenModel = _AdminHomePageModelBase
    with _$AdminHomePageScreenModel;

abstract class _AdminHomePageModelBase with Store {
//bools
  @observable
  bool isWordLoading = false;
  @observable
  bool isImageLoading = false;

  @observable
  bool isJobsLoading = false;
  @observable
  bool isMessagesLoading = false;

  @observable
  TextEditingController updateWordController = TextEditingController();
  @observable
  TextEditingController updateImageController = TextEditingController();
  @observable
  TextEditingController postArticleTitleController = TextEditingController();
  @observable
  TextEditingController postArticleContentController = TextEditingController();
  @observable
  TextEditingController postArticleImageController = TextEditingController();
  @observable
  TextEditingController jobTitleController = TextEditingController();
  @observable
  TextEditingController jobSubTitleController = TextEditingController();
  @observable
  TextEditingController jobImageController = TextEditingController();

  @observable
  List<Documents> jobs = ObservableList.of([]);
  @observable
  String urlJobs =
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/jobs/';
  @observable
  String urlMessages =
      'https://firestore.googleapis.com/v1/projects/eventopya-9e643/databases/(default)/documents/messages/';
  final JobsService _jobsService = JobsService();
  @observable
  WordsServiceModel wordsServiceModel = WordsServiceModel();
  final WordsService _wordsService = WordsService();

  @observable
  ImageServiceModel imageServiceModel = ImageServiceModel();
  final ImageService _imageService = ImageService();

  @observable
  List<DocumentsMessages> messages = ObservableList.of([]);
  final MessagesService _messagesService = MessagesService();

  @observable
  String imageData = '';
  @observable
  String imageArticleData = '';

  @action
  Future<void> initialize() async {
    await getWords().whenComplete(() => isWordLoading = true);
    await getImages().whenComplete(() => isImageLoading = true);

    await getJobs().whenComplete(() => isJobsLoading = true);
    await getMessages().whenComplete(() => isMessagesLoading = true);
  }

  @action
  Future<void> getJobs() async {
    jobs = (await _jobsService.getJobs())!;
  }

  @action
  Future<void> getMessages() async {
    messages = (await _messagesService.getMessages())!;
  }

  @action
  Future<void> getWords() async {
    wordsServiceModel = await _wordsService.getWords();
  }

  @action
  Future<void> getImages() async {
    imageServiceModel = await _imageService.getImagesHomePage();
  }

  @action
  Future<void> updateWordSection(
      {required String updateWord,
      required String wordControl,
      required BuildContext context}) async {
    if (updateWord == '') {
      context.snackBarExtension(content: 'Güncellemek için yazı girin');
      return;
    }
    if (wordControl == 'slogan') {
      _wordsService.updateStrings(updateWord: {
        'slogan': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'aboutTitle') {
      _wordsService.updateStrings(updateWord: {
        'aboutTitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'aboutSubtitle') {
      _wordsService.updateStrings(updateWord: {
        'aboutSubtitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'aboutContent') {
      _wordsService.updateStrings(updateWord: {
        'aboutContent': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'blogTitle') {
      _wordsService.updateStrings(updateWord: {
        'blogTitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'blogSubTitle') {
      _wordsService.updateStrings(updateWord: {
        'blogSubtitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'blogContent') {
      _wordsService.updateStrings(updateWord: {
        'blogContent': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'memoriesTitle') {
      _wordsService.updateStrings(updateWord: {
        'memoriesTitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'memoriesSubTitle') {
      _wordsService.updateStrings(updateWord: {
        'memoriesSubtitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'memoriesContent') {
      _wordsService.updateStrings(updateWord: {
        'memoriesContent': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'opinionsTitle') {
      _wordsService.updateStrings(updateWord: {
        'opinionsTitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'opinionsSubTitle') {
      _wordsService.updateStrings(updateWord: {
        'opinionsSubTitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'opinionsContent') {
      _wordsService.updateStrings(updateWord: {
        'opinionsContent': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'placesTitle') {
      _wordsService.updateStrings(updateWord: {
        'placesTitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'placesSubTitle') {
      _wordsService.updateStrings(updateWord: {
        'placesSubTitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'placesContent') {
      _wordsService.updateStrings(updateWord: {
        'placesContent': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'planTitle') {
      _wordsService.updateStrings(updateWord: {
        'planTitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'planSubTitle') {
      _wordsService.updateStrings(updateWord: {
        'planSubTitle': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'eventopyaAbout') {
      _wordsService.updateStrings(updateWord: {
        'eventopyaAbout': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'eventopyaPhone') {
      _wordsService.updateStrings(updateWord: {
        'eventopyaPhone': int.parse(updateWord)
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'eventopyaAdress') {
      _wordsService.updateStrings(updateWord: {
        'eventopyaAdress': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    } else if (wordControl == 'eventopyaMail') {
      _wordsService.updateStrings(updateWord: {
        'eventopyaMail': updateWord
      }).whenComplete(() =>
          AdminHomePageScreen().navigateToPushReplacement(context: context));
    }
  }

  Future<void> updateImageFromWebFolder(
      {required String imageTitle, required BuildContext context}) async {
    if (imageData.contains('https://')) return;
    Uint8List? fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker == null) return;
    imageData = base64Encode(fromPicker);
    if (imageTitle == 'Ana Resim') {
      await _imageService
          .patchImageHomePage(key: 'mainImage', value: imageData)
          .whenComplete(() =>
              context.snackBarExtension(content: 'Resim Başarıyla Güncellendi'))
          .whenComplete(() => AdminHomePageScreen()
              .navigateToPushReplacement(context: context));
    } else if (imageTitle == 'Hakkında Bölümü Resmi') {
      await _imageService
          .patchImageHomePage(key: 'aboutImage', value: imageData)
          .whenComplete(() =>
              context.snackBarExtension(content: 'Resim Başarıyla Güncellendi'))
          .whenComplete(() => AdminHomePageScreen()
              .navigateToPushReplacement(context: context));
    } else if (imageTitle == 'Mekan Bölümü Resmi') {
      await _imageService
          .patchImageHomePage(key: 'placesImage', value: imageData)
          .whenComplete(() =>
              context.snackBarExtension(content: 'Resim Başarıyla Güncellendi'))
          .whenComplete(() => AdminHomePageScreen()
              .navigateToPushReplacement(context: context));
    }
  }

  Future<void> updateImageFromLink(
      {required String link,
      required String imageTitle,
      required BuildContext context}) async {
    if (!link.contains('https://')) return;

    if (imageTitle == 'Ana Resim') {
      await _imageService
          .patchImageHomePage(key: 'mainImage', value: link)
          .whenComplete(() =>
              context.snackBarExtension(content: 'Resim Başarıyla Güncellendi'))
          .whenComplete(() => AdminHomePageScreen()
              .navigateToPushReplacement(context: context));
    } else if (imageTitle == 'Hakkında Bölümü Resmi') {
      await _imageService
          .patchImageHomePage(key: 'aboutImage', value: link)
          .whenComplete(() =>
              context.snackBarExtension(content: 'Resim Başarıyla Güncellendi'))
          .whenComplete(() => AdminHomePageScreen()
              .navigateToPushReplacement(context: context));
    } else if (imageTitle == 'Mekan Bölümü Resmi') {
      await _imageService
          .patchImageHomePage(key: 'placesImage', value: link)
          .whenComplete(() =>
              context.snackBarExtension(content: 'Resim Başarıyla Güncellendi'))
          .whenComplete(() => AdminHomePageScreen()
              .navigateToPushReplacement(context: context));
    }
  }

  Future<void> updateJob(
      {required String title,
      required String subTitle,
      required String image,
      required String url,
      required BuildContext context}) async {
    final Map<String, dynamic> patchData = {
      'fields': {
        'jobImage': {'stringValue': image},
        'jobTitle': {'stringValue': title},
        'jobSubTitle': {'stringValue': subTitle},
      },
    };

    await _jobsService.patchJobs(patchData: patchData, url: url).whenComplete(
        () =>
            AdminHomePageScreen().navigateToPushReplacement(context: context));
  }

  Future<void> postJob(
      {required String title,
      required String subTitle,
      required String image,
      required BuildContext context}) async {
    if (title == '' || subTitle == '' || image == '') {
      context.snackBarExtension(
          content: 'Başlık, Alt Başlık ya da Resim boş olamaz..');
      return;
    } else if (!image.contains('https://')) {
      context.snackBarExtension(content: 'Resim url olarak eklenmeli');
      return;
    }
    final Map<String, dynamic> postData = {
      'fields': {
        'jobImage': {'stringValue': image},
        'jobTitle': {'stringValue': title},
        'jobSubTitle': {'stringValue': subTitle},
      },
    };
    await _jobsService.postJobs(postData).whenComplete(() =>
        AdminHomePageScreen().navigateToPushReplacement(context: context));
  }

  Future<void> deleteJob(
      {required String url, required BuildContext context}) async {
    await _jobsService.deleteJobs(url).whenComplete(() =>
        AdminHomePageScreen().navigateToPushReplacement(context: context));
  }

  Future<void> patchShowMessage(
      {required bool isShowing,
      required String name,
      required String content,
      required String link,
      required BuildContext context}) async {
    _messagesService
        .patchIsShowing(
          link: link,
          isShowing: isShowing,
          content: content,
          name: name,
        )
        .whenComplete(() =>
            AdminHomePageScreen().navigateToPushReplacement(context: context));
  }

  Future<void> deleteMessage(
      {required String url, required BuildContext context}) async {
    await _messagesService.deleteMessages(url: url).whenComplete(() =>
        AdminHomePageScreen().navigateToPushReplacement(context: context));
  }
}
