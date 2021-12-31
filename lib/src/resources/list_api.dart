import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:neosoft_training_tasks/src/models/list_using_network_calls_model.dart';

class ListApi {
  final url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<ListUsingNetworkCallsModel>> fetchData() async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final List<dynamic> listMap = jsonDecode(response.body);

      final maps = listMap
          .map((map) => ListUsingNetworkCallsModel.fromJSON(map))
          .toList();
      return maps;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
