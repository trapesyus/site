import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'tabbar_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class TabBarScreenModel = _TabBarScreenModelBase with _$TabBarScreenModel;

abstract class _TabBarScreenModelBase with Store {
  @observable
  TextEditingController searchController = TextEditingController();
}
