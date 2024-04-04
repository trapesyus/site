import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';
import 'package:wedding_organise/core/extensions/padding_extension.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';
import 'package:wedding_organise/core/helper/custom_lottie_splash_view.dart';
import 'package:wedding_organise/core/widgets/label_text_widget.dart';
import 'package:wedding_organise/core/widgets/slide_bar_widget/slide_bar_widget.dart';
import 'package:wedding_organise/core/widgets/text_widget.dart';
import 'package:wedding_organise/core/widgets/title_text_widget.dart';
import 'package:wedding_organise/screen/home_screen/home_screen_model/home_screen_model.dart';

//1060tan küçükse plan bölümü axis.vertical olacak dolayısıyla sizedbox değişebilir

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}) {
    reaction((_) async => await _homeScreenModel.initialize(), (_) {},
        name: 'homeScreen');
  }
  final HomeScreenModel _homeScreenModel = HomeScreenModel();

  @override
  Widget build(BuildContext context) {
    return CustomSlideBarWidget(
      title: 'Eventopya',
      body: Observer(builder: (context) {
        return _homeScreenModel.isLoadingImage &&
                _homeScreenModel.isLoadingMessages &&
                _homeScreenModel.isLoadingText
            ? ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  _firstCard(context)
                      .getPaddingOnly(context: context, bottom: 0.04),
                  _thirdSection(context)
                      .getPaddingOnly(context: context, top: 0.02),
                  _fourthSection(context)
                      .getPaddingOnly(context: context, bottom: 0.04),
                  _homeScreenModel.messages.isEmpty
                      ? const SizedBox()
                      : _fifthSection(context)
                          .getPaddingOnly(context: context, bottom: 0.06),
                  _seventSection(context)
                ],
              )
            : const CustomLottieSplashView();
      }),
    );
  }

  Container _seventSection(BuildContext context) {
    return Container(
      height: context.getSizeHeight(size: 0.5),
      width: context.getSizeWidth(size: 1),
      color: ColorConstants.homePageLastSectionColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTitleText(
                    title: 'Eventopya', color: ColorConstants.bgColor),
                CustomText(
                        text: _homeScreenModel.words.eventopyaAbout ??
                            'Bir Hata Oluştu',
                        fontSize: 16,
                        color: ColorConstants.greyColor)
                    .getPaddingOnly(context: context, top: 0.02, left: 0.02),
              ],
            ),
          ),
          Expanded(
              child: Image.asset('assets/images/logo/wedding_logo.png',
                  filterQuality: FilterQuality.high))
        ],
      ),
    );
  }

  Column _fifthSection(BuildContext context) {
    return Column(
      children: [
        CustomTitleText(
          title: 'Müşteri Yorumları',
          color: ColorConstants.bgColor,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: context.getSizeHeight(size: 0.02)),
          height: context.getSizeHeight(size: 0.5),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _homeScreenModel.messages.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => SizedBox(
              width: context.getSizeWidth(size: 0.7),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Card(
                    margin: EdgeInsets.symmetric(
                        horizontal: context.getSizeWidth(size: 0.05),
                        vertical: context.getSizeHeight(size: 0.05)),
                    color: ColorConstants.hintCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: context.getSizeWidth(size: 0.01),
                              vertical: context.getSizeHeight(size: 0.02)),
                          title: CustomText(
                                  text:
                                      '${_homeScreenModel.messages[index].fields?.name?.stringValue}}',
                                  color: ColorConstants.bgColor,
                                  isBold: false)
                              .getPaddingOnly(context: context, bottom: 0.02),
                          subtitle: CustomText(
                            text: _homeScreenModel.messages[index].fields
                                    ?.comment?.stringValue ??
                                'Bir Hata Oluştu',
                            color: ColorConstants.bgColor,
                            isBold: true,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _fourthSection(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: context.getSizeHeight(size: 0.5),
              width: context.getSizeWidth(size: 0.5),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomLabelText(
                              isColorNotWhite: true,
                              label: _homeScreenModel.words.placesTitle ??
                                  'Bir Hata Oluştu')
                          .getPaddingOnly(context: context, top: 0.04),
                      CustomText(
                        text: _homeScreenModel.words.placesContent ??
                            'Bir Hata Oluştu',
                        color: ColorConstants.bgColor,
                      ).getPaddingOnly(
                          context: context, left: 0.05, right: 0.05, top: 0.05),
                    ],
                  ),
                ),
              ),
            ),
            _homeScreenModel.images.placesImage!.contains('https://')
                ? Image.network(
                    _homeScreenModel.images.placesImage!,
                    filterQuality: FilterQuality.high,
                    height: context.getSizeHeight(size: 0.5),
                    width: context.getSizeWidth(size: 0.5),
                    fit: BoxFit.cover,
                  )
                : Image.memory(
                    base64Decode(_homeScreenModel.images.placesImage!),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: context.getSizeHeight(size: 0.5),
                    width: context.getSizeWidth(size: 0.5),
                  )
          ],
        )
      ],
    );
  }

  Column _thirdSection(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _homeScreenModel.images.aboutImage!.contains('https://')
                ? Image.network(
                    _homeScreenModel.images.aboutImage!,
                    filterQuality: FilterQuality.high,
                    height: context.getSizeHeight(size: 0.5),
                    width: context.getSizeWidth(size: 0.5),
                    fit: BoxFit.cover,
                  )
                : Image.memory(
                    base64Decode(_homeScreenModel.images.aboutImage!),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: context.getSizeHeight(size: 0.5),
                    width: context.getSizeWidth(size: 0.5),
                  ),
            SizedBox(
              height: context.getSizeHeight(size: 0.5),
              width: context.getSizeWidth(size: 0.5),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomLabelText(
                          isColorNotWhite: true,
                          label: _homeScreenModel.words.aboutTitle ??
                              'Bir Hata Oluştu'),
                      CustomText(
                        text: '${_homeScreenModel.words.aboutContent}',
                        color: ColorConstants.bgColor,
                      ).getPaddingOnly(
                          context: context, left: 0.05, right: 0.05, top: 0.05),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

//_homeScreenModel.databaseReferenceTextContent?.child('aboutImage').path ??

  Container _firstCard(BuildContext context) {
    return Container(
        width: context.getSizeWidth(size: 1),
        height: context.getSizeHeight(size: 0.7),
        decoration: BoxDecoration(
            image: _homeScreenModel.images.mainImage!.contains('https://')
                ? DecorationImage(
                    image: NetworkImage(_homeScreenModel.images.mainImage!),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high)
                : DecorationImage(
                    image: MemoryImage(
                        base64Decode(_homeScreenModel.images.mainImage!)),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover)),
        child: _firstCardItems(context));
  }

  Column _firstCardItems(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTitleText(
                title: _homeScreenModel.words.slogan!
                    .replaceAll(',', ',\n')
                    .toUpperCase(),
                color: ColorConstants.whiteColor)
            .getPaddingOnly(context: context, right: 0.03),
      ],
    );
  }
}
