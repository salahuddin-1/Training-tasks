import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';

class ThemeDataCustom {
  ThemeData themeData(BuildContext context) {
    return ThemeData(
      primaryColor: White,
      accentColor: White,
      scaffoldBackgroundColor: White,
      buttonColor: CYAN,
      appBarTheme: _appbarTheme(),
      textSelectionTheme: _cusrsorTheme(),
    );
  }

  TextSelectionThemeData _cusrsorTheme() {
    return TextSelectionThemeData(
      cursorColor: Colors.black,
    );
  }

  AppBarTheme _appbarTheme() {
    return AppBarTheme(
      centerTitle: true,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: CYAN,
          fontSize: 18,
        ),
      ),
    );
  }
}
