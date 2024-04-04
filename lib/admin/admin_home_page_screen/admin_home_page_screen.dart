import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_home_page_screen/admin_home_page_model/admin_home_page_model.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';
import 'package:wedding_organise/core/enum/url_enum.dart';
import 'package:wedding_organise/core/extensions/padding_extension.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';
import 'package:wedding_organise/core/widgets/appbar_widget.dart';
import 'package:wedding_organise/core/widgets/elevated_button_widget.dart';
import 'package:wedding_organise/core/widgets/icon_button_widget.dart';
import 'package:wedding_organise/core/widgets/label_text_widget.dart';
import 'package:wedding_organise/core/widgets/progress_indicator.dart';
import 'package:wedding_organise/core/widgets/text_widget.dart';
import 'package:wedding_organise/core/widgets/textfield_widget.dart';
import 'package:wedding_organise/core/widgets/title_text_widget.dart';

class AdminHomePageScreen extends StatelessWidget {
  AdminHomePageScreen({super.key}) {
    reaction(
        (_) async => await _adminHomePageScreenModel
            .initialize()
            .whenComplete(() => null),
        (_) {});
  }
  final AdminHomePageScreenModel _adminHomePageScreenModel =
      AdminHomePageScreenModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        title: 'Ana Sayfa Paneli',
        titleStyle: true,
        leading: CustomIconButton(
            color: ColorConstants.bgColor,
            icon:
                const Icon(CupertinoIcons.back, color: ColorConstants.bgColor),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 1,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) => SizedBox(
              height: context.getSizeHeight(size: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Observer(builder: (context) {
                    return Column(
                      children: [
                        CustomTitleText(
                            title: 'Yazılar', color: ColorConstants.bgColor),
                        CustomLabelText(
                                label: 'Slogan Bölümü', isColorNotWhite: true)
                            .getPaddingOnly(
                                context: context, bottom: 0.02, top: 0.02),
                        _adminHomePageScreenModel.isWordLoading
                            ? _wordContainer(
                                text: _adminHomePageScreenModel
                                        .wordsServiceModel.slogan ??
                                    'Bir Hata Oluştu',
                                onPressed: () async => await _wordShowDialog(
                                    context: context,
                                    oldWord:
                                        _adminHomePageScreenModel
                                                .wordsServiceModel.slogan ??
                                            'Bir Hata Oluştu',
                                    title: 'Slogan',
                                    onPressed: () async =>
                                        await _adminHomePageScreenModel
                                            .updateWordSection(
                                                context: context,
                                                updateWord:
                                                    _adminHomePageScreenModel
                                                        .updateWordController
                                                        .value
                                                        .text,
                                                wordControl: 'slogan')),
                                context: context)
                            : const CustomCircularProgress(),
                        CustomTitleText(
                                title: 'İş Hizmetleri Bölümü',
                                color: ColorConstants.bgColor)
                            .getPaddingOnly(
                                context: context, bottom: 0.02, top: 0.02),
                        SizedBox(
                            height: context.getSizeHeight(
                                size: 0.1 *
                                    _adminHomePageScreenModel.jobs.length),
                            width: context.getSizeWidth(size: 1),
                            child: _adminHomePageScreenModel.isJobsLoading
                                ? ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: context.getSizeHeight(size: 0.02),
                                    ),
                                    scrollDirection: Axis.vertical,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        _adminHomePageScreenModel.jobs.length,
                                    itemBuilder: (context, index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomLabelText(
                                                label: 'Hizmet Başlığı',
                                                isColorNotWhite: true)
                                            .getPaddingOnly(
                                                context: context, bottom: 0.01),
                                        _wordContainer(
                                            context: context,
                                            text: _adminHomePageScreenModel.jobs[index].fields?.jobTitle!.stringValue ??
                                                'Bir Hata Oluştu',
                                            onPressed: () async => await _wordShowDialogUpdateForJobs(
                                                context: context,
                                                title: 'İş Başlığı',
                                                subTitle: 'İş Alt Başlığı',
                                                image: 'İş Arkaplan Resmi',
                                                oldWordTitle: _adminHomePageScreenModel.jobs[index].fields?.jobTitle!.stringValue ??
                                                    'Bir Hata Oluştu',
                                                oldWordSubTitle: _adminHomePageScreenModel
                                                        .jobs[index]
                                                        .fields
                                                        ?.jobSubTitle!
                                                        .stringValue ??
                                                    'Bir Hata Oluştu',
                                                oldWordImage: _adminHomePageScreenModel.jobs[index].fields?.jobImage!.stringValue ??
                                                    'Bir Hata Oluştu',
                                                url: _adminHomePageScreenModel.urlJobs +
                                                    _adminHomePageScreenModel
                                                        .jobs[index].name!
                                                        .split('/')
                                                        .last,
                                                onPressed: () async => await _adminHomePageScreenModel.updateJob(
                                                    context: context,
                                                    title: _adminHomePageScreenModel.jobTitleController.value.text,
                                                    subTitle: _adminHomePageScreenModel.jobSubTitleController.value.text,
                                                    image: _adminHomePageScreenModel.jobImageController.value.text,
                                                    url: _adminHomePageScreenModel.urlJobs + _adminHomePageScreenModel.jobs[index].name!.split('/').last))),
                                      ],
                                    ),
                                  )
                                : const CustomCircularProgress()),
                        CustomElevatedButton(
                            buttonText: 'Yeni Hizmet Ekle',
                            onPressed: () => _wordShowDialogPostForJobs(
                                  context: context,
                                  image: 'İş Arkaplan Resmi',
                                  subTitle: 'İş Alt Başlığı',
                                  title: 'İş Başlığı',
                                  onPressed: () async =>
                                      await _adminHomePageScreenModel.postJob(
                                          title: _adminHomePageScreenModel
                                              .jobTitleController.value.text,
                                          subTitle: _adminHomePageScreenModel
                                              .jobSubTitleController.value.text,
                                          image: _adminHomePageScreenModel
                                              .jobImageController.value.text,
                                          context: context),
                                )).getPaddingOnly(context: context, top: 0.02),
                        CustomLabelText(
                                label: 'Hakkında Bölümü', isColorNotWhite: true)
                            .getPaddingOnly(
                                context: context, bottom: 0.02, top: 0.02),
                        Row(
                          children: [
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        context: context,
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel.aboutTitle ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Hakkında Başlığı',
                                            oldWord: _adminHomePageScreenModel
                                                    .wordsServiceModel
                                                    .aboutSubTitle ??
                                                'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'aboutTitle',
                                                        context: context)))
                                    : const CustomCircularProgress()),
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        context: context,
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel
                                                .aboutSubTitle ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Hakkında Alt Başlığı',
                                            oldWord:
                                                _adminHomePageScreenModel
                                                        .wordsServiceModel
                                                        .aboutSubTitle ??
                                                    'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'aboutSubTitle',
                                                        context: context)))
                                    : const CustomCircularProgress()),
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        context: context,
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel
                                                .aboutContent ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Hakkında İçeriği',
                                            oldWord: _adminHomePageScreenModel
                                                    .wordsServiceModel.aboutContent ??
                                                'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'aboutContent',
                                                        context: context)))
                                    : const CustomCircularProgress())
                          ],
                        ),
                        CustomLabelText(
                                label: 'Mekan Bölümü', isColorNotWhite: true)
                            .getPaddingOnly(
                                context: context, bottom: 0.02, top: 0.02),
                        Row(
                          children: [
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel.placesTitle ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Mekan Başlığı',
                                            oldWord: _adminHomePageScreenModel
                                                    .wordsServiceModel
                                                    .placesTitle ??
                                                'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'placesTitle',
                                                        context: context)),
                                        context: context)
                                    : const CustomCircularProgress()),
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel
                                                .placesSubTitle ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Mekan Alt Başlığı',
                                            oldWord: _adminHomePageScreenModel
                                                    .wordsServiceModel
                                                    .placesSubTitle ??
                                                'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'placesSubTitle',
                                                        context: context)),
                                        context: context)
                                    : const CustomCircularProgress()),
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel
                                                .placesContent ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Mekan İçeriği',
                                            oldWord:
                                                _adminHomePageScreenModel
                                                        .wordsServiceModel
                                                        .placesContent ??
                                                    'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'placesContent',
                                                        context: context)),
                                        context: context)
                                    : const CustomCircularProgress()),
                          ],
                        ),
                        CustomLabelText(
                                label: 'Anılar Bölümü', isColorNotWhite: true)
                            .getPaddingOnly(
                                context: context, bottom: 0.02, top: 0.02),
                        Row(
                          children: [
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel
                                                .memoriesTitle ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Anılar Başlığı',
                                            oldWord:
                                                _adminHomePageScreenModel
                                                        .wordsServiceModel
                                                        .memoriesTitle ??
                                                    'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'memoriesTitle',
                                                        context: context)),
                                        context: context)
                                    : const CustomCircularProgress()),
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel
                                                .memoriesSubTitle ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Anılar Alt Başlığı',
                                            oldWord: _adminHomePageScreenModel
                                                    .wordsServiceModel
                                                    .memoriesSubTitle ??
                                                'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'memoriesSubTitle',
                                                        context: context)),
                                        context: context)
                                    : const CustomCircularProgress()),
                          ],
                        ),
                        CustomLabelText(
                                label: 'Müşteri Görüş Bölümü',
                                isColorNotWhite: true)
                            .getPaddingOnly(
                                context: context, bottom: 0.02, top: 0.02),
                        SizedBox(
                            height: context.getSizeHeight(
                                size: 0.1 *
                                    _adminHomePageScreenModel.messages.length),
                            width: context.getSizeWidth(size: 1),
                            child: _adminHomePageScreenModel.isMessagesLoading
                                ? ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                            height: context.getSizeHeight(
                                                size: 0.02)),
                                    itemCount: _adminHomePageScreenModel
                                        .messages.length,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return _wordContainer(
                                          context: context,
                                          text:
                                              '${_adminHomePageScreenModel.messages[index].fields?.name?.stringValue} ',
                                          onPressed: () async =>
                                              await _wordShowDialogForMessages(
                                                context: context,
                                                index: index,
                                                isShowing:
                                                    _adminHomePageScreenModel
                                                        .messages[index]
                                                        .fields!
                                                        .isShow!
                                                        .booleanValue!,
                                                title: 'Müşteri Görüş Başlığı',
                                                nameSurname:
                                                    '${_adminHomePageScreenModel.messages[index].fields?.name?.stringValue}',
                                                comment:
                                                    _adminHomePageScreenModel
                                                            .messages[index]
                                                            .fields
                                                            ?.comment
                                                            ?.stringValue ??
                                                        'Bir Hata Oluştu',
                                                url: _adminHomePageScreenModel
                                                        .urlMessages +
                                                    _adminHomePageScreenModel
                                                        .messages[index].name!
                                                        .split('/')
                                                        .last,
                                                onPressed: () async => await _adminHomePageScreenModel.patchShowMessage(
                                                    link:
                                                        '${UrlEnum.urlMessages.url}/${_adminHomePageScreenModel.messages[index].name!.split('/').last}',
                                                    isShowing:
                                                        _adminHomePageScreenModel
                                                                    .messages[
                                                                        index]
                                                                    .fields!
                                                                    .isShow!
                                                                    .booleanValue! ==
                                                                true
                                                            ? false
                                                            : true,
                                                    name:
                                                        _adminHomePageScreenModel
                                                            .messages[index]
                                                            .fields!
                                                            .name!
                                                            .stringValue!,
                                                    content:
                                                        _adminHomePageScreenModel
                                                            .messages[index]
                                                            .fields!
                                                            .comment!
                                                            .stringValue!,
                                                    context: context),
                                              ));
                                    })
                                : const CustomCircularProgress()),
                        CustomLabelText(
                                label: 'Sayfanın En Alt Bölümü',
                                isColorNotWhite: true)
                            .getPaddingOnly(
                                context: context, bottom: 0.02, top: 0.02),
                        Row(
                          children: [
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel
                                                .eventopyaAbout ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Eventopya Hakkında Yazısı',
                                            oldWord: _adminHomePageScreenModel
                                                    .wordsServiceModel
                                                    .eventopyaAbout ??
                                                'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'eventopyaAbout',
                                                        context: context)),
                                        context: context)
                                    : const CustomCircularProgress()),
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        text: _adminHomePageScreenModel
                                            .wordsServiceModel.eventopyaPhone
                                            .toString(),
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Eventopya Hakkında Yazısı',
                                            oldWord: _adminHomePageScreenModel
                                                .wordsServiceModel
                                                .eventopyaPhone
                                                .toString(),
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'eventopyaPhone',
                                                        context: context)),
                                        context: context)
                                    : const CustomCircularProgress()),
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel
                                                .eventopyaAdress ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Eventopya Hakkında Yazısı',
                                            oldWord: _adminHomePageScreenModel
                                                    .wordsServiceModel
                                                    .eventopyaAdress ??
                                                'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'eventopyaAdress',
                                                        context: context)),
                                        context: context)
                                    : const CustomCircularProgress()),
                            Expanded(
                                child: _adminHomePageScreenModel.isWordLoading
                                    ? _wordContainer(
                                        text: _adminHomePageScreenModel
                                                .wordsServiceModel
                                                .eventopyaMail ??
                                            'Bir Hata Oluştu',
                                        onPressed: () async => await _wordShowDialog(
                                            context: context,
                                            title: 'Eventopya Hakkında Yazısı',
                                            oldWord:
                                                _adminHomePageScreenModel
                                                        .wordsServiceModel
                                                        .eventopyaMail ??
                                                    'Bir Hata Oluştu',
                                            onPressed: () async =>
                                                await _adminHomePageScreenModel
                                                    .updateWordSection(
                                                        updateWord:
                                                            _adminHomePageScreenModel
                                                                .updateWordController
                                                                .value
                                                                .text,
                                                        wordControl:
                                                            'eventopyaMail',
                                                        context: context)),
                                        context: context)
                                    : const CustomCircularProgress()),
                          ],
                        ),
                        CustomTitleText(
                                title: 'Resimler',
                                color: ColorConstants.bgColor)
                            .getPaddingOnly(context: context, top: 0.04),
                        CustomLabelText(
                                label: 'Ana Resim', isColorNotWhite: true)
                            .getPaddingOnly(
                                context: context, bottom: 0.02, top: 0.02),
                        Expanded(
                          child: _adminHomePageScreenModel.isImageLoading
                              ? _imagesContainer(
                                  title: 'Ana Resim',
                                  context: context,
                                  imageUrl: _adminHomePageScreenModel
                                      .imageServiceModel.mainImage!,
                                )
                              : const CustomCircularProgress(),
                        ),
                        CustomLabelText(
                                label: 'Hakkında Bölümü Resmi',
                                isColorNotWhite: true)
                            .getPaddingOnly(
                                context: context, bottom: 0.02, top: 0.02),
                        Expanded(
                            child: _adminHomePageScreenModel.isImageLoading
                                ? _imagesContainer(
                                    title: 'Hakkında Bölümü Resmi',
                                    context: context,
                                    imageUrl: _adminHomePageScreenModel
                                        .imageServiceModel.aboutImage!,
                                  )
                                : const CustomCircularProgress()),
                        CustomLabelText(
                                label: 'Mekan Bölümü Resmi',
                                isColorNotWhite: true)
                            .getPaddingOnly(
                                context: context, bottom: 0.02, top: 0.02),
                        Expanded(
                            child: _adminHomePageScreenModel.isImageLoading
                                ? _imagesContainer(
                                    title: 'Mekan Bölümü Resmi',
                                    context: context,
                                    imageUrl: _adminHomePageScreenModel
                                        .imageServiceModel.placesImage!,
                                  )
                                : const CustomCircularProgress())
                      ],
                    ).getPaddingOnly(
                        context: context,
                        left: 0.02,
                        right: 0.02,
                        bottom: 0.02);
                  })),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Future<dynamic> _wordShowDialog(
      {required BuildContext context,
      required String title,
      required String oldWord,
      required Function() onPressed}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTitleText(title: title, color: ColorConstants.bgColor),
        content: _adminHomePageScreenModel.isWordLoading
            ? CustomLabelText(
                label: 'Güncel $title: $oldWord', isColorNotWhite: true)
            : const CustomCircularProgress(),
        actions: [
          Column(
            children: [
              CustomTextField(
                controller: _adminHomePageScreenModel.updateWordController,
                label: 'Yeni $title Yazısı',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomElevatedButton(buttonText: 'Güncelle', onPressed: onPressed)
                  .getPaddingOnly(
                      context: context,
                      bottom: 0.02,
                      left: 0.3,
                      right: 0.3,
                      top: 0.04),
              CustomElevatedButton(
                      buttonText: 'Vazgeç',
                      onPressed: () => Navigator.of(context).pop())
                  .getPaddingOnly(
                      context: context, left: 0.3, right: 0.3, bottom: 0.02)
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> _wordShowDialogUpdateForJobs(
      {required BuildContext context,
      required String title,
      required String subTitle,
      required String image,
      required String oldWordTitle,
      required String oldWordSubTitle,
      required String oldWordImage,
      required String url,
      required Function() onPressed}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTitleText(title: title, color: ColorConstants.bgColor),
        content: _adminHomePageScreenModel.isWordLoading
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(
                          label: 'Güncel $title: $oldWordTitle',
                          isColorNotWhite: true)
                      .getPaddingOnly(context: context, bottom: 0.02),
                  CustomLabelText(
                          label: 'Güncel $subTitle: $oldWordSubTitle',
                          isColorNotWhite: true)
                      .getPaddingOnly(context: context, bottom: 0.02),
                  CustomLabelText(
                          label: 'Güncel $image: $oldWordImage',
                          isColorNotWhite: true)
                      .getPaddingOnly(context: context, bottom: 0.02),
                ],
              )
            : const CustomCircularProgress(),
        actions: [
          Column(
            children: [
              CustomTextField(
                controller: _adminHomePageScreenModel.jobTitleController,
                label: 'Yeni $title Yazısı',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomTextField(
                controller: _adminHomePageScreenModel.jobSubTitleController,
                label: 'Yeni $subTitle Yazısı',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomTextField(
                controller: _adminHomePageScreenModel.jobImageController,
                label: 'Yeni $image Yazısı',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomElevatedButton(buttonText: 'Güncelle', onPressed: onPressed)
                  .getPaddingOnly(
                      context: context,
                      bottom: 0.02,
                      left: 0.3,
                      right: 0.3,
                      top: 0.04),
              CustomElevatedButton(
                  buttonText: 'Sil',
                  onPressed: () async => _adminHomePageScreenModel.deleteJob(
                      url: url, context: context)).getPaddingOnly(
                  context: context, left: 0.3, right: 0.3, bottom: 0.02),
              CustomElevatedButton(
                      buttonText: 'Vazgeç',
                      onPressed: () => Navigator.of(context).pop())
                  .getPaddingOnly(
                      context: context, left: 0.3, right: 0.3, bottom: 0.02)
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> _wordShowDialogForMessages(
      {required BuildContext context,
      required String title,
      required String nameSurname,
      required String comment,
      required int index,
      required bool isShowing,
      required String url,
      required Function() onPressed}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTitleText(title: title, color: ColorConstants.bgColor),
        content: _adminHomePageScreenModel.isMessagesLoading
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabelText(label: nameSurname, isColorNotWhite: true)
                      .getPaddingOnly(context: context, bottom: 0.02),
                  CustomLabelText(label: comment, isColorNotWhite: true)
                      .getPaddingOnly(context: context, bottom: 0.02),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: onPressed,
                          child: _messagesIsShowButton(
                            context: context,
                            color: _adminHomePageScreenModel.messages[index]
                                    .fields!.isShow!.booleanValue!
                                ? ColorConstants.orangeColor
                                : ColorConstants.greyColor.shade200,
                            isShowText: _adminHomePageScreenModel
                                    .messages[index]
                                    .fields!
                                    .isShow!
                                    .booleanValue!
                                ? 'Gösteriliyor'
                                : 'Gösterilmiyor',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const CustomCircularProgress(),
        actions: [
          Column(
            children: [
              CustomElevatedButton(
                      buttonText: 'Sil',
                      onPressed: () async => _adminHomePageScreenModel
                          .deleteMessage(url: url, context: context))
                  .getPaddingOnly(
                      context: context, left: 0.3, right: 0.3, bottom: 0.02),
              CustomElevatedButton(
                      buttonText: 'Vazgeç',
                      onPressed: () => Navigator.of(context).pop())
                  .getPaddingOnly(
                      context: context, left: 0.3, right: 0.3, bottom: 0.02)
            ],
          )
        ],
      ),
    );
  }

  Container _messagesIsShowButton(
      {required BuildContext context,
      required String isShowText,
      required Color color}) {
    return Container(
      alignment: Alignment.center,
      height: context.getSizeHeight(size: 0.05),
      width: context.getSizeWidth(size: 0.1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: CustomText(text: isShowText, color: ColorConstants.bgColor),
    );
  }

  Future<dynamic> _wordShowDialogPostForJobs(
      {required BuildContext context,
      required String title,
      required String subTitle,
      required String image,
      required Function() onPressed}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTitleText(title: title, color: ColorConstants.bgColor),
        actions: [
          Column(
            children: [
              CustomTextField(
                controller: _adminHomePageScreenModel.jobTitleController,
                label: 'Yeni $title Yazısı',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomTextField(
                controller: _adminHomePageScreenModel.jobSubTitleController,
                label: 'Yeni $subTitle Yazısı',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomTextField(
                controller: _adminHomePageScreenModel.jobImageController,
                label: 'Yeni $image Yazısı',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomElevatedButton(buttonText: 'Ekle', onPressed: onPressed)
                  .getPaddingOnly(
                      context: context,
                      bottom: 0.02,
                      left: 0.3,
                      right: 0.3,
                      top: 0.04),
              CustomElevatedButton(
                      buttonText: 'Vazgeç',
                      onPressed: () => Navigator.of(context).pop())
                  .getPaddingOnly(
                      context: context, left: 0.3, right: 0.3, bottom: 0.02)
            ],
          )
        ],
      ),
    );
  }

  Container _imagesContainer(
      {required BuildContext context,
      required String title,
      required String imageUrl}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          _adminHomePageScreenModel.isImageLoading
              ? imageUrl.contains('https://')
                  ? Image.network(imageUrl,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          height: context.getSizeHeight(size: 0.8))
                      .getPaddingOnly(context: context, bottom: 0.02)
                  : Image.memory(
                      base64Decode(imageUrl),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      height: context.getSizeHeight(size: 0.8),
                    ).getPaddingOnly(context: context, bottom: 0.02)
              : const CustomCircularProgress()
                  .getPaddingOnly(context: context, bottom: 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  child: CustomText(
                      text: 'Güncelle', color: ColorConstants.orangeColor)),
              CustomIconButton(
                  icon: const Icon(
                    CupertinoIcons.pen,
                    color: ColorConstants.orangeColor,
                  ),
                  onPressed: () async => await _imageShowDialog(
                      context: context,
                      title: title,
                      onPressed: () async => await _adminHomePageScreenModel
                          .updateImageFromWebFolder(
                              context: context, imageTitle: title)))
            ],
          )
        ],
      ),
    );
  }

  Padding _wordContainer(
      {required String text,
      required Function() onPressed,
      required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: const Border.fromBorderSide(
              BorderSide(color: ColorConstants.greenColor))),
      child: ListTile(
        title: CustomLabelText(
          label: text,
          isColorNotWhite: true,
        ),
        trailing: CustomIconButton(
            icon: const Icon(CupertinoIcons.pencil,
                color: ColorConstants.orangeColor),
            onPressed: onPressed),
      ),
    ).getPaddingOnly(context: context, right: 0.02);
  }

  Future<dynamic> _imageShowDialog(
      {required BuildContext context,
      required String title,
      required Function() onPressed}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTitleText(title: title, color: ColorConstants.bgColor),
        actions: [
          Column(
            children: [
              CustomTextField(
                controller: _adminHomePageScreenModel.updateImageController,
                label: 'Eğer url ise buraya yapıştırın',
                labelStyle: true,
                horizontalHeight: 0.02,
                verticalHeight: 0.02,
                sizeLeft: 0.02,
                sizeBottom: 0.02,
                sizeRight: 0.02,
                sizeTop: 0.02,
              ),
              CustomElevatedButton(
                      buttonText: 'Dosya Seç', onPressed: onPressed)
                  .getPaddingOnly(
                      context: context,
                      bottom: 0.02,
                      left: 0.3,
                      right: 0.3,
                      top: 0.04),
              CustomElevatedButton(
                  buttonText: 'Gönder',
                  onPressed: () async => _adminHomePageScreenModel
                              .updateImageController.value.text !=
                          ''
                      ? await _adminHomePageScreenModel.updateImageFromLink(
                          context: context,
                          link: _adminHomePageScreenModel
                              .updateImageController.value.text,
                          imageTitle: title)
                      : _adminHomePageScreenModel.imageData != ''
                          ? await _adminHomePageScreenModel
                              .updateImageFromWebFolder(
                                  context: context, imageTitle: title)
                          : null).getPaddingOnly(
                  context: context, left: 0.3, right: 0.3, bottom: 0.02),
              CustomElevatedButton(
                      buttonText: 'Vazgeç',
                      onPressed: () => Navigator.of(context).pop())
                  .getPaddingOnly(
                      context: context, left: 0.3, right: 0.3, bottom: 0.02),
            ],
          )
        ],
      ),
    );
  }
}
