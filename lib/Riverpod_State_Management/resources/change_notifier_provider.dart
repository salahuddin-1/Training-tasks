import 'dart:collection';

import 'package:flutter/material.dart';

class NumberChangeNotifier extends ChangeNotifier {
  final List<int> _numbers = [];

  UnmodifiableListView<int> get numbers => UnmodifiableListView(_numbers);

  void addNumber(int number) {
    _numbers.add(number);
    notifyListeners();
  }
}
