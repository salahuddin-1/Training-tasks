import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';

class Screen2 extends StatelessWidget {
  final String title;

  const Screen2({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, title),
      body: Center(
        child: Text(this.title),
      ),
    );
  }
}
