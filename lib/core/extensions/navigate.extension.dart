import 'package:flutter/material.dart';

extension NavigateTo on Widget {
  Future navigateTo({required BuildContext context}) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => this));
}

extension NavigateToPushReplacement on Widget {
  Future navigateToPushReplacement({required BuildContext context}) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => this));
}

extension NavigateToBack on Widget {
  void navigateToBack({required BuildContext context}) =>
      Navigator.pop(context);
}
