import 'package:mobx/mobx.dart';

class Counter {
  Observable<int> counter = Observable(0);

  late Action increment;

  Counter() {
    increment = Action(
      () {
        counter.value++;
      },
    );
  }
}
