import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Riverpod_State_Management/screens/riverpod_screen.dart';
import 'package:neosoft_training_tasks/Riverpod_State_Management/screens/riverpod_screen_change_notifier_provider.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';

import 'future_stream_provider.dart';

class MyAppForRiverpodStateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoSOFT Training Tasks',
      debugShowCheckedModeBanner: false,
      theme: _ThemeDataCustom()._themeData(context),
      home: RiverpodFutureStreamProvider(),
    );
  }
}

class _ThemeDataCustom {
  ThemeData _themeData(BuildContext context) {
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
