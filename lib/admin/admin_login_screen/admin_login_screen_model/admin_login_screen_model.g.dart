// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_login_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdminLoginScreenModel on _AdminLoginScreenModelBase, Store {
  late final _$mailControllerAtom =
      Atom(name: '_AdminLoginScreenModelBase.mailController', context: context);

  @override
  TextEditingController get mailController {
    _$mailControllerAtom.reportRead();
    return super.mailController;
  }

  @override
  set mailController(TextEditingController value) {
    _$mailControllerAtom.reportWrite(value, super.mailController, () {
      super.mailController = value;
    });
  }

  late final _$passwordControllerAtom = Atom(
      name: '_AdminLoginScreenModelBase.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  @override
  String toString() {
    return '''
mailController: ${mailController},
passwordController: ${passwordController}
    ''';
  }
}
