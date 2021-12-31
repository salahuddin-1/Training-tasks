import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Dependency_injection/resources/bloc_class.dart';
import 'package:neosoft_training_tasks/Dependency_injection/resources/get_it_initialise.dart';
import 'package:neosoft_training_tasks/src/resources/navigation.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';

import 'DI_screen2.dart';

class DependencyInjectionScreen extends StatefulWidget {
  const DependencyInjectionScreen({Key? key}) : super(key: key);

  @override
  _DependencyInjectionScreenState createState() =>
      _DependencyInjectionScreenState();
}

class _DependencyInjectionScreenState extends State<DependencyInjectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Dependency Injection'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print(getIt<BLOCclass>().hashCode);
                print(getIt<BLOCclass>().hashCode);
                print(getIt<BLOCclass>().hashCode);
              },
              child: Text("Push Some value"),
            ),
            TextButton(
              onPressed: () {
                Push(context, pushTo: DIScreen2());
              },
              child: Text("Go to next screen"),
            ),
          ],
        ),
      ),
    );
  }
}
