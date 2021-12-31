import 'package:mobx/mobx.dart';

// Generated file
part 'counter.g.dart';

// We cannot access this class directly
// So we'll make another class below this abstract
abstract class Counter with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}

// Now u can use this class
class CounterStore = Counter with _$CounterStore;

// Now run this command
// flutter packages pub run build_runner build
