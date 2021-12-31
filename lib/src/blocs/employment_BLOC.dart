import 'dart:async';

import 'package:rxdart/rxdart.dart';

class EmploymentBLOC {
  final _streamCntrl = new BehaviorSubject<String>.seeded('Employed');

  setValue(String val) {
    _streamCntrl.sink.add(val);
  }

  Stream<String> get stream => _streamCntrl.stream;

  String get value => _streamCntrl.value;

  void dispose() {
    _streamCntrl.close();
  }
}
