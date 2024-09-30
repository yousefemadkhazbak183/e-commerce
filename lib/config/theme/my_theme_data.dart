import 'package:e_commerce_app/core/utils/colors/color_manager.dart';
import 'package:e_commerce_app/core/utils/styles/style_manager.dart';
import 'package:flutter/material.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
    titleSmall: getRegularStyle(color: ColorManager.black),
  ));
}
