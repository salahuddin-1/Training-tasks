import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';

class DIExample1Screen extends StatefulWidget {
  const DIExample1Screen({Key? key}) : super(key: key);

  @override
  _DIExample1ScreenState createState() => _DIExample1ScreenState();
}

class _DIExample1ScreenState extends State<DIExample1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('DI Example 1'),
    );
  }
}
