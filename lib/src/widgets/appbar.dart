import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/src/resources/navigation.dart';

appbar(BuildContext context, String title, {List<Widget>? actions}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Pop(context);
      },
      icon: Icon(Icons.arrow_back_ios),
    ),
    actions: actions,
  );
}

AppBar appBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    automaticallyImplyLeading: false,
  );
}
