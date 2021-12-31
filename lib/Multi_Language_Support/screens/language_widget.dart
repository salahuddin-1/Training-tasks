import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/l10n/l10n.dart';

class LanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final country = L10n.getCountry(locale.languageCode);

    return Center(
      child: Text(
        "Country of Origin : " + country,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
