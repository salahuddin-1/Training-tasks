import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'Dependency_injection/resources/get_it_initialise.dart';
import 'GetX/route_management/screens/key_value_storage/get_storage_resources.dart';
import 'my_app.dart';

// void main() async {
//   await initialiseFirebase();

//   callFCMbackgrounfMessageHandler();

//   runApp(MyApp());
// }

/// Run this main mathod for Riverpod Example
// void main() {
//   runApp(ProviderScope(child: MyAppForRiverpodStateManagement()));
// }

// Run this for HIVE Database
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initialiseHive();
//   runApp(MyApp());
// }

// void main() {
//   runApp(MyApp());
//   setup();
// }

// Run this for GetX Storage
void main() async {
  await initialiseGetxStorage();
  runApp(MyApp());
}
