import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neosoft_training_tasks/src/widgets/center_column_widget.dart';

import 'DI_getX_resources.dart';

class DIGetxScreen2 extends StatefulWidget {
  @override
  State<DIGetxScreen2> createState() => _DIGetxScreen2State();
}

class _DIGetxScreen2State extends State<DIGetxScreen2> {
  @override
  void initState() {
    final instance = Get.find<DIGetXResources>();

    print(instance.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenterColumn(
        children: [],
      ),
    );
  }
}
