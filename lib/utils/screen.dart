import 'package:flutter/material.dart';

class Screen {
  BuildContext context;

  Screen(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Screen of(BuildContext context) {
    return Screen(context);
  }
}
