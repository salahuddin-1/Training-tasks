import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neosoft_training_tasks/Biometric%20Authentication%20lib/local_auth_screen.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';
import 'package:neosoft_training_tasks/src/widgets/center_column_widget.dart';

import 'DI_getX_resources.dart';
import 'DI_getX_screen2.dart';

class DIGetX extends StatefulWidget {
  @override
  State<DIGetX> createState() => _DIGetXState();
}

class _DIGetXState extends State<DIGetX> {
  @override
  void initState() {
    Get.put(DIGetXResources("Salahuddin"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(context.textScaleFactor);
    return Scaffold(
      appBar: appBar('Dependency Injection GetX'),
      body: CenterColumn(
        children: [
          MyButton(
            onPressed: () {
              Get.to(() => DIGetxScreen2());
            },
            title: "Push",
          ),
        ],
      ),
    );
  }
}
