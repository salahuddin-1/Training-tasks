import 'package:rxdart/rxdart.dart';

class GenderBLOC {
  final _genderBloc = BehaviorSubject<Map<String, bool>>.seeded({
    'male': true,
    'female': false,
  });

  Stream<Map<String, bool>> get genderStream => _genderBloc.stream;

  Map<String, bool> get value => _genderBloc.value;

  selectGender(String key) {
    Map<String, bool> map;

    if (key == 'female') {
      map = {
        'male': false,
        'female': true,
      };
    } else {
      map = {
        'male': true,
        'female': false,
      };
    }
    _genderBloc.sink.add(map);
  }

  dispose() {
    _genderBloc.close();
  }
}
