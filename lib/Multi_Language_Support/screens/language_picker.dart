import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Multi_Language_Support/bloc/multi_lang_BLOC.dart';
import 'package:neosoft_training_tasks/l10n/l10n.dart';

class LanguagePickerWidget extends StatelessWidget {
  final MultiLangBLOC multiLangBLOC;

  LanguagePickerWidget(this.multiLangBLOC);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<Locale>(
        onChanged: (locale) {
          multiLangBLOC.setLocale(locale!);
        },
        value: multiLangBLOC.locale,
        items: L10n.all.map(
          (locale) {
            final country = L10n.getCountry(locale.languageCode);

            return DropdownMenuItem(
              child: Center(
                child: Text(country),
              ),
              value: locale,
            );
          },
        ).toList(),
      ),
    );
  }
}
