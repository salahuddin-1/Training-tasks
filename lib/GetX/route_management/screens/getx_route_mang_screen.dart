import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neosoft_training_tasks/Biometric%20Authentication%20lib/local_auth_screen.dart';
import 'package:neosoft_training_tasks/GetX/route_management/screens/screen2.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';

class GetxRouteManagementScreen extends StatelessWidget {
  const GetxRouteManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('GetX Route Management'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onPressed: () {
                Get.to(() => Screen2(title: 'Pushed'));
              },
              title: "Push GetX",
            ),
            MyButton(
              onPressed: () {
                Get.snackbar(
                  'Hello',
                  'This will be the message',
                  colorText: Colors.red,
                  backgroundColor: Colors.black,
                );
              },
              title: "Show Snack bar",
            ),
            MyButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Dialog",
                  middleText: "Middle Text",
                  content: Text("Content"),
                  confirm: Text('Confirm'),
                  backgroundColor: Colors.red,
                  actions: [
                    Text('Ok'),
                  ],
                );
              },
              title: "Show Dialog",
            ),
            MyButton(
              onPressed: () {
                Get.dialog(
                  Container(
                    height: 100,
                    width: 100,
                    child: Scaffold(
                      body: Container(
                        child: Text("Normal Dialog"),
                      ),
                    ),
                  ),
                );
              },
              title: "Normal Dialog",
            ),
            MyButton(
              onPressed: () {
                final String value = "889891174.txt";

                print(
                  GetUtils.isTxt(value),
                );
              },
              title: "Get Utils",
            ),
          ],
        ),
      ),
    );
  }
}
