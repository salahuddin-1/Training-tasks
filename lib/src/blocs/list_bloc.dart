import 'dart:async';

import 'package:neosoft_training_tasks/src/models/list_using_network_calls_model.dart';
import 'package:neosoft_training_tasks/src/resources/list_api.dart';

class ListBLOC {
  ListBLOC() {
    getData();
  }

  final _streamCntrl =
      StreamController<List<ListUsingNetworkCallsModel>>.broadcast();

  Stream<List<ListUsingNetworkCallsModel>> get stream => _streamCntrl.stream;

  getData() async {
    var model = await ListApi().fetchData();
    _streamCntrl.sink.add(model);
  }

  void dispose() {
    _streamCntrl.close();
  }
}
