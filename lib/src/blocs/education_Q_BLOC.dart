import 'dart:async';

import 'package:rxdart/rxdart.dart';

class EducationQBLOC {
  final _streamCntrl = new BehaviorSubject<String>.seeded('B.E');

  setValue(String val) {
    _streamCntrl.sink.add(val);
  }

  Stream<String> get stream => _streamCntrl.stream;

  String get value => _streamCntrl.value;

  void dispose() {
    _streamCntrl.close();
  }
}
