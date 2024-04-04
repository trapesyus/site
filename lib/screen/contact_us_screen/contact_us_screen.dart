import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';
import 'package:wedding_organise/core/extensions/padding_extension.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';
import 'package:wedding_organise/core/helper/custom_lottie_splash_view.dart';
import 'package:wedding_organise/core/helper/custom_text_field_contact_us_screen.dart';
import 'package:wedding_organise/core/widgets/icon_button_widget.dart';
import 'package:wedding_organise/core/widgets/label_text_widget.dart';
import 'package:wedding_organise/core/widgets/slide_bar_widget/slide_bar_widget.dart';
import 'package:wedding_organise/core/widgets/text_button_widget.dart';
import 'package:wedding_organise/core/widgets/text_widget.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:wedding_organise/screen/contact_us_screen/contact_us_screen_model/contact_us_screen_model.dart';

import '../../core/widgets/title_text_widget.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key}) {
    reaction((_) async => await _contactUsScreenModel.initialize(), (_) {});
  }
  final ContactUsScreenModel _contactUsScreenModel = ContactUsScreenModel();
  @override
  Widget build(BuildContext context) {
    return CustomSlideBarWidget(
      title: 'Eventopya',
      body: Observer(builder: (context) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _contactUsScreenModel.isLoading
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _mainImage(context),
                      SizedBox(
                        height: context.getSizeHeight(size: 0.7),
                        width: context.getSizeWidth(size: 0.96),
                        child: Stack(children: [
                          Positioned(
                              top: context.getSizeHeight(size: 0.05),
                              bottom: context.getSizeHeight(size: 0.03),
                              left: context.getSizeHeight(size: 0.02),
                              right: context.getSizeHeight(size: 0.02),
                              child: _backCard(context)),
                          Positioned(
                              top: context.getSizeHeight(size: 0.12),
                              bottom: context.getSizeHeight(size: 0.08),
                              left: context.getSizeHeight(size: 0.04),
                              right: context.getSizeHeight(size: 0.04),
                              child: _forwardCard(context)),
                        ]),
                      ),
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Container(
                            width: context.getSizeWidth(size: 0.94),
                            height: context.getSizeHeight(size: 0.5),
                            padding: EdgeInsets.symmetric(
                                horizontal: context.getSizeWidth(size: 0.02),
                                vertical: context.getSizeHeight(size: 0.04)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstants.greyColor.shade300),
                            child: FlutterMap(
                              mapController:
                                  _contactUsScreenModel.mapController,
                              options: MapOptions(
                                  initialCenter: LatLng(
                                      _contactUsScreenModel
                                          .contactInfoModel.adress!.latitude!
                                          .toDouble(),
                                      _contactUsScreenModel
                                          .contactInfoModel.adress!.longtitude!
                                          .toDouble()),
                                  initialZoom: _contactUsScreenModel.zoomCount,
                                  interactionOptions: const InteractionOptions(
                                      enableScrollWheel: false,
                                      scrollWheelVelocity: 0.0)),
                              children: [
                                TileLayer(
                                    urlTemplate:
                                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                    subdomains: const ['a', 'b', 'c']),
                                MarkerLayer(
                                    alignment: Alignment.center,
                                    markers: [
                                      Marker(
                                          point: LatLng(
                                              _contactUsScreenModel
                                                  .contactInfoModel
                                                  .adress!
                                                  .latitude!
                                                  .toDouble(),
                                              _contactUsScreenModel
                                                  .contactInfoModel
                                                  .adress!
                                                  .longtitude!
                                                  .toDouble()),
                                          child: IconButton(
                                              onPressed: () async =>
                                                  await _contactUsScreenModel
                                                      .getDirections(
                                                          context: context),
                                              icon: const Icon(
                                                  CupertinoIcons.flag_fill,
                                                  color: ColorConstants
                                                      .orangeColor))),
                                    ])
                              ],
                            )).getPaddingOnly(context: context, bottom: 0.02),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          defaultTargetPlatform == TargetPlatform.android ||
                                  defaultTargetPlatform == TargetPlatform.iOS
                              ? Expanded(
                                  child: _mapToolTip(context).getPaddingOnly(
                                    context: context,
                                    right: 0.01,
                                    bottom: 0.02,
                                  ),
                                )
                              : _mapToolTip(context).getPaddingOnly(
                                  context: context,
                                  right: 0.01,
                                  bottom: 0.02,
                                ),
                          _zoomButton(
                              context: context,
                              icon: const Icon(CupertinoIcons.add,
                                  color: ColorConstants.bgColor),
                              onPressed: () =>
                                  _contactUsScreenModel.zoomPlus()),
                          _zoomButton(
                                  context: context,
                                  icon: const Icon(CupertinoIcons.minus,
                                      color: ColorConstants.bgColor),
                                  onPressed: () =>
                                      _contactUsScreenModel.zoomMinus())
                              .getPaddingOnly(context: context, right: 0.02),
                        ],
                      ),
                      Container(
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
                                      title: 'Eventopya',
                                      color: ColorConstants.bgColor),
                                  CustomText(
                                          text: _contactUsScreenModel
                                                  .words.eventopyaAbout ??
                                              'Bir Hata Oluştu',
                                          fontSize: 16,
                                          color: ColorConstants.greyColor)
                                      .getPaddingOnly(
                                          context: context,
                                          top: 0.02,
                                          left: 0.02),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Image.asset(
                                    'assets/images/logo/wedding_logo.png',
                                    filterQuality: FilterQuality.high))
                          ],
                        ),
                      ),
                    ],
                  )
                : const CustomLottieSplashView(),
          ],
        );
      }),
    );
  }

  Container _mapToolTip(BuildContext context) {
    return Container(
      width: context.getSizeWidth(size: 0.022),
      height: context.getSizeHeight(size: 0.04),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.greyColor.shade300),
      child: _customToolTip(
          message: 'Yol tarifine ulaşmak için lütfen bayrak ikonuna tıklayın',
          color: ColorConstants.bgColor),
    );
  }

  Container _forwardCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: _contactUsScreenModel.isChangeCard
              ? ColorConstants.cardBlueAccentColor
              : ColorConstants.cardBlueColor,
          borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _contactUsScreenModel.isChangeCard
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              _eventopyaInformation().getPaddingOnly(
                                  context: context, bottom: 0.02, top: 0.02),
                              _contactInfo(
                                context: context,
                                icon: const Icon(CupertinoIcons.phone,
                                    color: ColorConstants.whiteColor),
                                text: '05074343942',
                                onPressed: () async =>
                                    await _contactUsScreenModel.getCall(
                                        context: context),
                              ),
                              _contactInfo(
                                  icon: const Icon(SimpleIcons.whatsapp,
                                      color: ColorConstants.whiteColor),
                                  text: 'WHATSAPP',
                                  onPressed: () async =>
                                      await _contactUsScreenModel.getWhatsapp(
                                          context: context),
                                  context: context),
                              _contactInfo(
                                  context: context,
                                  icon: const Icon(SimpleIcons.instagram,
                                      color: ColorConstants.whiteColor),
                                  onPressed: () async =>
                                      await _contactUsScreenModel
                                          .getInstagram(),
                                  text: 'INSTAGRAM'),
                              _contactInfo(
                                      context: context,
                                      icon: const Icon(SimpleIcons.x,
                                          color: ColorConstants.whiteColor),
                                      text: 'X',
                                      onPressed: () {})
                                  .getPaddingOnly(
                                      context: context, right: 0.02),
                              _contactInfo(
                                  context: context,
                                  icon: const Icon(SimpleIcons.facebook,
                                      color: ColorConstants.whiteColor),
                                  text: 'FACEBOOK',
                                  onPressed: () {}),
                              _contactInfo(
                                      icon: const Icon(SimpleIcons.gmail,
                                          color: ColorConstants.whiteColor),
                                      text: 'MAIL',
                                      onPressed: () async =>
                                          await _contactUsScreenModel.getMail(),
                                      context: context)
                                  .getPaddingOnly(context: context, right: 0.02)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: CustomText(
                              color: ColorConstants.whiteColor,
                              text: _contactUsScreenModel
                                      .contactScreenServiceModel.text ??
                                  _contactUsScreenModel.textLoadError)),
                    ],
                  ).getPaddingOnly(
                    context: context, top: 0.02, right: 0.02, bottom: 0.02)
                : Column(
                    children: [
                      _shareOpinion(context: context).getPaddingOnly(
                          context: context, bottom: 0.02, top: 0.02),
                      _textField(
                          controller: _contactUsScreenModel.nameController,
                          label: 'Ad Soyad'),
                      _textField(
                              controller:
                                  _contactUsScreenModel.commentController,
                              label: 'Yorum')
                          .getPaddingOnly(context: context, bottom: 0.02),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FloatingActionButton(
                                backgroundColor:
                                    _contactUsScreenModel.isChangeCard
                                        ? ColorConstants.cardBlueColor
                                        : ColorConstants.cardBlueAccentColor,
                                onPressed: () async =>
                                    _contactUsScreenModel.postMessage(
                                        nameSurname: _contactUsScreenModel
                                            .nameController.value.text,
                                        content: _contactUsScreenModel
                                            .commentController.value.text,
                                        context: context),
                                child: CustomText(
                                    text: 'Gönder',
                                    color: ColorConstants.whiteColor))
                            .getPaddingOnly(
                                context: context, right: 0.02, bottom: 0.01),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Container _backCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: _contactUsScreenModel.isChangeCard
              ? ColorConstants.cardBlueColor
              : ColorConstants.cardBlueAccentColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        _contactUsScreenModel.isChangeCard
            ? _shareOpinion(context: context)
            : _eventopyaInformation(),
      ]),
    );
  }

  Container _mainImage(BuildContext context) {
    return Container(
        height: context.getSizeHeight(size: 0.3),
        width: context.getSizeWidth(size: 1),
        decoration: BoxDecoration(
          image: _contactUsScreenModel.contactScreenServiceModel.image!
                  .contains('https://')
              ? DecorationImage(
                  image: NetworkImage(
                      _contactUsScreenModel.contactScreenServiceModel.image!),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover)
              : DecorationImage(
                  image: MemoryImage(base64Decode(
                      _contactUsScreenModel.contactScreenServiceModel.image!)),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover),
        ),
        child: null);
  }

  Padding _contactInfo(
      {required Icon icon,
      required String text,
      required Function onPressed,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        CustomTextButton(
          text: text,
          onPressed: onPressed,
          color: ColorConstants.whiteColor,
        ),
      ],
    ).getPaddingOnly(context: context, bottom: 0.02, left: 0.02);
  }

  Padding _zoomButton(
      {required Icon icon,
      required Function() onPressed,
      required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.greyColor.shade300),
      child: CustomIconButton(icon: icon, onPressed: onPressed),
    ).getPaddingOnly(context: context, right: 0.01, bottom: 0.02);
  }

  Row _eventopyaInformation() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const SizedBox(),
      CustomLabelText(label: 'İletişim', isColorNotWhite: false),
      _contactUsScreenModel.isChangeCard
          ? const SizedBox()
          : Row(
              children: [
                _customToolTip(
                    message:
                        'İletişim bilgileri için lütfen ok butonuna tıklayın',
                    color: ColorConstants.whiteColor),
                CustomIconButton(
                    icon: const Icon(Icons.contact_phone_outlined),
                    onPressed: () => _contactUsScreenModel.checkChangeCard(),
                    color: ColorConstants.whiteColor),
              ],
            )
    ]);
  }

  Row _shareOpinion({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        CustomLabelText(
            label: 'Görüşlerinizi Paylaşın', isColorNotWhite: false),
        _contactUsScreenModel.isChangeCard
            ? Row(
                children: [
                  _customToolTip(
                      message:
                          'Görüşlerinizi paylaşmak için lütfen ok ikonuna tıklayın.',
                      color: ColorConstants.whiteColor),
                  CustomIconButton(
                      icon: const Icon(CupertinoIcons.conversation_bubble),
                      onPressed: () => _contactUsScreenModel.checkChangeCard(),
                      color: ColorConstants.whiteColor),
                ],
              )
            : const SizedBox()
      ],
    );
  }

  Tooltip _customToolTip({required String message, required Color color}) {
    return Tooltip(
      message: message,
      textStyle: const TextStyle(color: ColorConstants.bgColor),
      showDuration: const Duration(seconds: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.greyColor.shade300),
      child: Icon(CupertinoIcons.info, color: color),
    );
  }

  CustomTextFieldContactUsScreen _textField({
    required TextEditingController controller,
    required String label,
  }) {
    return CustomTextFieldContactUsScreen(
      controller: controller,
      label: label,
      labelStyle: true,
      horizontalHeight: 0.02,
      verticalHeight: 0.02,
      sizeLeft: 0.02,
      sizeBottom: 0.02,
      sizeRight: 0.02,
    );
  }
}
