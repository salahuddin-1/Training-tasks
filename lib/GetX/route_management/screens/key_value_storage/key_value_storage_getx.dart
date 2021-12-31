import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:neosoft_training_tasks/Biometric%20Authentication%20lib/local_auth_screen.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';

class KeyValueStorageGetx extends StatelessWidget {
  final GetStorage _storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('GetX Storage'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onPressed: () {
                _storage.write("2", 2);
              },
              title: "Put in Storage",
            ),
            MyButton(
              onPressed: () {
                final data = _storage.read('1');

                print(data);
              },
              title: "Get from Storage",
            ),
            MyButton(
              onPressed: () {
                _storage.listen(
                  () {
                    print('added');
                  },
                );
              },
              title: "Add listener",
            ),
          ],
        ),
      ),
    );
  }
}
