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
import 'package:wedding_organise/screen/services_screen/services_screen_model/services_screen_model.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key}) {
    reaction((_) async => await _serviceServiceModel.initialize(), (_) {},
        name: 'planScreen');
  }
  final ServicesScreenModel _serviceServiceModel = ServicesScreenModel();
  @override
  Widget build(BuildContext context) {
    return CustomSlideBarWidget(
      title: 'Eventopya',
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Observer(builder: (context) {
            return _serviceServiceModel.isLoading
                ? Column(
                    children: [
                      _firstCard(context)
                          .getPaddingOnly(context: context, bottom: 0.04),
                      SizedBox(
                        height: context.getSizeHeight(
                            size: 0.43 * _serviceServiceModel.items.length),
                        width: context.getSizeWidth(size: 1),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: _serviceServiceModel.items.length,
                          itemBuilder: (context, index) => _planScreenItems(
                              onTapContent: () => showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      actions: [
                                        Container(
                                          height:
                                              context.getSizeHeight(size: 0.7),
                                          width:
                                              context.getSizeWidth(size: 0.8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomLabelText(
                                                    label: _serviceServiceModel
                                                            .items[index]
                                                            .fields
                                                            ?.text
                                                            ?.stringValue ??
                                                        _serviceServiceModel
                                                            .textLoadError,
                                                    isColorNotWhite: true),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: CustomText(
                                                            fontSize: 16,
                                                            text: _serviceServiceModel
                                                                    .items[
                                                                        index]
                                                                    .fields
                                                                    ?.content
                                                                    ?.stringValue
                                                                    ?.replaceAll(
                                                                        '.',
                                                                        '\n-->\t') ??
                                                                _serviceServiceModel
                                                                    .textLoadError,
                                                            color:
                                                                ColorConstants
                                                                    .greyColor
                                                                    .shade600),
                                                      ),
                                                      Expanded(
                                                          child: _serviceServiceModel
                                                                  .items[index]
                                                                  .fields!
                                                                  .image!
                                                                  .stringValue!
                                                                  .contains(
                                                                      'https://')
                                                              ? Image.network(
                                                                  _serviceServiceModel
                                                                          .items[
                                                                              index]
                                                                          .fields!
                                                                          .image!
                                                                          .stringValue ??
                                                                      _serviceServiceModel
                                                                          .imageLoadError,
                                                                  filterQuality:
                                                                      FilterQuality
                                                                          .high,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )
                                                              : Image.memory(
                                                                  base64Decode(_serviceServiceModel
                                                                      .items[
                                                                          index]
                                                                      .fields!
                                                                      .image!
                                                                      .stringValue!),
                                                                  filterQuality:
                                                                      FilterQuality
                                                                          .high,
                                                                  fit: BoxFit
                                                                      .cover))
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    ColorConstants
                                                                        .orangeColor
                                                                        .shade400),
                                                            onPressed: () =>
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(),
                                                            child: CustomLabelText(
                                                                label: 'Kapat',
                                                                isColorNotWhite:
                                                                    false)))
                                                    .getPaddingOnly(
                                                        context: context,
                                                        top: 0.02)
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                              context: context,
                              image: _serviceServiceModel.items[index].fields
                                      ?.image?.stringValue ??
                                  _serviceServiceModel.imageLoadError,
                              title: _serviceServiceModel
                                      .items[index].fields?.text?.stringValue ??
                                  _serviceServiceModel.textLoadError),
                        ),
                      ),
                    ],
                  )
                : const CustomLottieSplashView();
          })
        ],
      ),
    );
  }

  Padding _planScreenItems(
      {required BuildContext context,
      required String image,
      required String title,
      required Function() onTapContent}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: context.getSizeHeight(size: 0.4),
          width: context.getSizeWidth(size: 0.44),
          decoration: BoxDecoration(
              image: image.contains('https://')
                  ? DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high)
                  : DecorationImage(
                      image: MemoryImage(base64Decode(image)),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high),
              color: ColorConstants.hintPinkColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        GestureDetector(
          onTap: onTapContent,
          child: Container(
              height: context.getSizeHeight(size: 0.4),
              width: context.getSizeWidth(size: 0.44),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  horizontal: context.getSizeWidth(size: 0.06),
                  vertical: context.getSizeHeight(size: 0.02)),
              decoration: const BoxDecoration(
                  color: ColorConstants.greenColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: SingleChildScrollView(
                child: CustomLabelText(label: title, isColorNotWhite: false),
              )),
        )
      ],
    ).getPaddingOnly(context: context, left: 0.02, right: 0.02, bottom: 0.02);
  }

  Container _firstCard(BuildContext context) {
    return Container(
        width: context.getSizeWidth(size: 1),
        height: context.getSizeHeight(size: 0.4),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            image: _serviceServiceModel.mainItems.mainImage!
                    .contains('https://')
                ? DecorationImage(
                    image: NetworkImage(
                      _serviceServiceModel.mainItems.mainImage ??
                          _serviceServiceModel.imageLoadError,
                    ),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high)
                : DecorationImage(
                    image: MemoryImage(
                      base64Decode(_serviceServiceModel.mainItems.mainImage!),
                    ),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high)),
        child: Center(
            child: CustomTitleText(
                title: _serviceServiceModel.mainItems.mainText ??
                    _serviceServiceModel.textLoadError,
                color: ColorConstants.whiteColor)));
  }
}
