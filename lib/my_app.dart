import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:neosoft_training_tasks/GetX/route_management/screens/getx_route_mang_screen.dart';
import 'package:neosoft_training_tasks/src/widgets/circular_progress.dart';

import 'GetX/dependency_injection/DI_getX.dart';
import 'GetX/route_management/screens/key_value_storage/key_value_storage_getx.dart';
import 'Multi_Language_Support/bloc/multi_lang_BLOC.dart';
import 'Multi_Language_Support/screens/multi_language_support_screem.dart';
import 'l10n/l10n.dart';
import 'src/widgets/theme_data.dart';

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late MultiLangBLOC _multiLangBLOC;

//   @override
//   void initState() {
//     _multiLangBLOC = MultiLangBLOC();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<Locale?>(
//         stream: _multiLangBLOC.stream,
//         builder: (context, snapshot) {
//           return MaterialApp(
//             title: 'NeoSOFT Training Tasks',
//             debugShowCheckedModeBanner: false,
//             theme: ThemeDataCustom().themeData(context),
//             home: MultiLanguageSupportScreen(_multiLangBLOC),
//             locale: _multiLangBLOC.locale,
//             supportedLocales: L10n.all,
//             localizationsDelegates: [
//               AppLocalizations.delegate,
//               GlobalMaterialLocalizations.delegate,
//               GlobalCupertinoLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//             ],
//           );
//         });
//   }
// }

// ------ Use this for GetX ---------------------
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NeoSOFT Training Tasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeDataCustom().themeData(context),
      home: GetxRouteManagementScreen(),
    );
  }
}
