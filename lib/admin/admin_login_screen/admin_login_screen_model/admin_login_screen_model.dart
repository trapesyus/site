import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:wedding_organise/admin/admin_screen/admin_screen.dart';
import 'package:wedding_organise/core/extensions/navigate.extension.dart';
import 'package:wedding_organise/core/extensions/snackbar_extension.dart';
part 'admin_login_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class AdminLoginScreenModel = _AdminLoginScreenModelBase
    with _$AdminLoginScreenModel;

abstract class _AdminLoginScreenModelBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @observable
  TextEditingController mailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();

  Future<void> login(
      {required String mail,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: mail, password: password);
      if (context.mounted) {
        AdminScreen().navigateToPushReplacement(context: context);
      }

      log('başarılı');
    } on FirebaseAuthException catch (_) {
      if (context.mounted) {
        context.snackBarExtension(content: 'Kullanıcı Adı ya da Şifre yanlış');
      }
    }
  }
}
