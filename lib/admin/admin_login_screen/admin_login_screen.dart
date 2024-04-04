import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wedding_organise/admin/admin_login_screen/admin_login_screen_model/admin_login_screen_model.dart';
import 'package:wedding_organise/core/constants/color_constants.dart';
import 'package:wedding_organise/core/extensions/padding_extension.dart';
import 'package:wedding_organise/core/extensions/size_extension.dart';
import 'package:wedding_organise/core/widgets/align_widget.dart';
import 'package:wedding_organise/core/widgets/appbar_widget.dart';

import 'package:wedding_organise/core/widgets/elevated_button_widget.dart';
import 'package:wedding_organise/core/widgets/label_text_widget.dart';
import 'package:wedding_organise/core/widgets/textfield_widget.dart';

class AdminLoginScreen extends StatelessWidget {
  AdminLoginScreen({super.key});
  final AdminLoginScreenModel _adminLoginScreenModel = AdminLoginScreenModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Observer(builder: (context) {
      return Scaffold(
        appBar: const CustomAppBar(
            centerTitle: true,
            title: 'Eventopya',
            backgroundColor: Colors.transparent,
            titleStyle: true),
        body: CustomAlign(
          isCenter: true,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: ColorConstants.siteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: const Border.fromBorderSide(
                        BorderSide(color: ColorConstants.bgColor))),
                width: context.getSizeWidth(size: 0.5),
                height: context.getSizeHeight(size: 0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomLabelText(
                      label: 'Admin Girişi',
                      isColorNotWhite: true,
                    ),
                    CustomTextField(
                      sizeLeft: 0.02,
                      sizeRight: 0.02,
                      sizeBottom: 0.02,
                      sizeTop: 0.02,
                      horizontalHeight: 0.02,
                      verticalHeight: 0.02,
                      label: 'E-Posta',
                      labelStyle: true,
                      controller: _adminLoginScreenModel.mailController,
                    ).getPaddingOnly(context: context),
                    CustomTextField(
                      sizeLeft: 0.02,
                      sizeRight: 0.02,
                      sizeBottom: 0.02,
                      horizontalHeight: 0.02,
                      verticalHeight: 0.02,
                      label: 'Şifre',
                      labelStyle: true,
                      passwordType: true,
                      controller: _adminLoginScreenModel.passwordController,
                    ).getPaddingOnly(context: context, bottom: 0.02),
                    CustomElevatedButton(
                        buttonText: 'Giriş Yap',
                        onPressed: () async =>
                            _adminLoginScreenModel.mailController.value.text !=
                                        '' &&
                                    _adminLoginScreenModel
                                            .passwordController.value.text !=
                                        ''
                                ? await _adminLoginScreenModel.login(
                                    context: context,
                                    mail: _adminLoginScreenModel
                                        .mailController.value.text,
                                    password: _adminLoginScreenModel
                                        .passwordController.value.text)
                                : null).getPaddingOnly(
                        context: context, right: 0.08, left: 0.08)
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }));
  }
}
