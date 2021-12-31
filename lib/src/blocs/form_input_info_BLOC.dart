import 'package:neosoft_training_tasks/src/models/forms_input_model.dart';
import 'package:rxdart/subjects.dart';

class FormInputInfoBLOC {
  final _streamCntrl = new BehaviorSubject<List<FormInputModel>>.seeded([]);

  Stream<List<FormInputModel>> get stream => _streamCntrl.stream;

  feed(FormInputModel formInputModel) {
    var list = _streamCntrl.value;

    list.insert(0, formInputModel);

    _streamCntrl.sink.add(list);
  }

  editAndFeed(FormInputModel formInputModel, int index) {
    var list = _streamCntrl.value;

    list.removeAt(index);
    list.insert(index, formInputModel);

    _streamCntrl.sink.add(list);
  }

  deleteAndFeed(int index) {
    var list = _streamCntrl.value;

    list.removeAt(index);
    _streamCntrl.sink.add(list);
  }

  void dispose() {
    _streamCntrl.close();
  }
}
