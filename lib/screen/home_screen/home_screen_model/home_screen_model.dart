import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wedding_organise/core/enum/link_enum.dart';

import 'package:wedding_organise/service/images/images_home_screen/images_home_screen_model/images_home_screen_model.dart';
import 'package:wedding_organise/service/images/images_home_screen/images_home_screen_service/images_home_screen_service.dart';
import 'package:wedding_organise/service/jobs/jobs_model/jobs_model.dart';
import 'package:wedding_organise/service/jobs/jobs_service/jobs_service.dart';
import 'package:wedding_organise/service/messages/messages_model/messages_service_model.dart';
import 'package:wedding_organise/service/messages/messages_service/messages_service.dart';
import 'package:wedding_organise/service/words/words_model/words_model.dart';
import 'package:wedding_organise/service/words/words_service/words_service.dart';

part 'home_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel;

abstract class _HomeScreenModelBase with Store {
  @observable
  bool cardSizeColorCheck = false;

  @observable
  bool isLoadingText = false;
  @observable
  bool isLoadingImage = false;

  @observable
  bool isLoadingJobs = false;
  @observable
  bool isLoadingMessages = false;

  @observable
  List<Documents> jobs = ObservableList.of([]);
  final JobsService _jobsService = JobsService();

  @observable
  List<DocumentsMessages> messages = ObservableList.of([]);
  final MessagesService _messagesService = MessagesService();

  @observable
  WordsServiceModel words = WordsServiceModel();
  final WordsService _wordsService = WordsService();
  @observable
  ImageServiceModel images = ImageServiceModel();
  final ImageService _imageService = ImageService();

  @observable
  ScrollController scrollController = ScrollController();

  Future<void> initialize() async {
    await getTextStrings().whenComplete(() => isLoadingText = true);
    await getTextImages().whenComplete(() => isLoadingImage = true);

    await getJobs().whenComplete(() => isLoadingJobs = true);
    await getMessages().whenComplete(() => isLoadingMessages = true);
  }

  Future<void> getJobs() async {
    jobs = (await _jobsService.getJobs())!;
  }

  Future<void> getTextStrings() async {
    words = await _wordsService.getWords();
  }

  Future<void> getTextImages() async {
    images = await _imageService.getImagesHomePage();
  }

  Future<void> getMessages() async {
    final List<DocumentsMessages> tempMessages =
        (await _messagesService.getMessages())!;
    for (var element in tempMessages) {
      if (element.fields?.isShow?.booleanValue == true) {
        messages.add(element);
      }
    }
  }

  @action
  void cardSizeColorChecker() {
    cardSizeColorCheck = !cardSizeColorCheck;
  }

  Future<void> getInstagram() async {
    final url = LinkEnum.instagramLink.link;
    await launchUrlString(url);
  }
}
