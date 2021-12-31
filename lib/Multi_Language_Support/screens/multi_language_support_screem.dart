import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Multi_Language_Support/bloc/multi_lang_BLOC.dart';
import 'package:neosoft_training_tasks/Multi_Language_Support/screens/language_widget.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'language_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MultiLanguageSupportScreen extends StatefulWidget {
  final MultiLangBLOC multiLangBLOC;

  MultiLanguageSupportScreen(this.multiLangBLOC);

  @override
  _MultiLanguageSupportScreenState createState() =>
      _MultiLanguageSupportScreenState();
}

class _MultiLanguageSupportScreenState
    extends State<MultiLanguageSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Language Support'),
        actions: [
          LanguagePickerWidget(widget.multiLangBLOC),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageWidget(),
            SizedBox(
              height: 20,
            ),
            Text(AppLocalizations.of(context).language),
            Text(AppLocalizations.of(context).helloWorld),
          ],
        ),
      ),
    );
  }
}
