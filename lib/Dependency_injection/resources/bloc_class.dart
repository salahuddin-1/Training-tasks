import 'package:rxdart/rxdart.dart';

class BLOCclass {
  final _streamCntrl = BehaviorSubject<int>();

  int get value => _streamCntrl.value;

  void sink(int value) {
    _streamCntrl.add(value);
  }

  Stream<int> get stream => _streamCntrl.stream;

  void dispose() {
    _streamCntrl.close();
  }
}
