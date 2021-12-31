import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('hi'),
    const Locale('es'),
    const Locale('de'),
  ];

  static String getCountry(String code) {
    switch (code) {
      case 'ar':
        return "Saudi Arabia";

      case 'hi':
        return "India";

      case 'es':
        return "Spain";

      case 'de':
        return "Germany";

      default:
        return "England";
    }
  }
}
