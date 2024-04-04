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
import 'package:wedding_organise/screen/plan_screen/plan_screen_model/plan_screen_model.dart';

class PlanScreen extends StatelessWidget {
  PlanScreen({super.key}) {
    reaction((_) async => await _planScreenModel.initialize(), (_) {},
        name: 'planScreen');
  }
  final PlanScreenModel _planScreenModel = PlanScreenModel();
  @override
  Widget build(BuildContext context) {
    return CustomSlideBarWidget(
      title: 'Eventopya',
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Observer(builder: (context) {
            return _planScreenModel.isLoading
                ? Column(
                    children: [
                      _firstCard(context)
                          .getPaddingOnly(context: context, bottom: 0.04),
                      SizedBox(
                        height: context.getSizeHeight(
                            size: 0.43 * _planScreenModel.items.length),
                        width: context.getSizeWidth(size: 1),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _planScreenModel.items.length,
                          itemBuilder: (context, index) => _planScreenItems(
                              onTapContent: () =>
                                  _customShowDialog(context, index),
                              context: context,
                              image: _planScreenModel.items[index].fields?.image
                                      ?.stringValue ??
                                  _planScreenModel.imageLoadError,
                              title: _planScreenModel
                                      .items[index].fields?.text?.stringValue ??
                                  _planScreenModel.textLoadError),
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

  Future<dynamic> _customShowDialog(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          Container(
            height: context.getSizeHeight(size: 0.7),
            width: context.getSizeWidth(size: 0.8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                      label: _planScreenModel
                              .items[index].fields?.text?.stringValue ??
                          _planScreenModel.textLoadError,
                      isColorNotWhite: true),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomText(
                              fontSize: 16,
                              text: _planScreenModel
                                      .items[index].fields?.content?.stringValue
                                      ?.replaceAll('.', '\n-->\t') ??
                                  _planScreenModel.textLoadError,
                              color: ColorConstants.greyColor.shade600),
                        ),
                        Expanded(
                            child: _planScreenModel
                                    .items[index].fields!.image!.stringValue!
                                    .contains('https://')
                                ? Image.network(
                                    _planScreenModel.items[index].fields!.image!
                                            .stringValue ??
                                        _planScreenModel.imageLoadError,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                  )
                                : Image.memory(
                                    base64Decode(_planScreenModel.items[index]
                                        .fields!.image!.stringValue!),
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover))
                      ],
                    ),
                  ),
                  Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorConstants.orangeColor.shade400),
                              onPressed: () => Navigator.of(context).pop(),
                              child: CustomLabelText(
                                  label: 'Kapat', isColorNotWhite: false)))
                      .getPaddingOnly(context: context, top: 0.02)
                ]),
          )
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
            image: _planScreenModel.mainItems.mainImage!.contains('https://')
                ? DecorationImage(
                    image: NetworkImage(
                      _planScreenModel.mainItems.mainImage ??
                          _planScreenModel.imageLoadError,
                    ),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high)
                : DecorationImage(
                    image: MemoryImage(
                      base64Decode(_planScreenModel.mainItems.mainImage!),
                    ),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high)),
        child: Center(
            child: CustomTitleText(
                title: _planScreenModel.mainItems.mainText ??
                    _planScreenModel.textLoadError,
                color: ColorConstants.whiteColor)));
  }
}
