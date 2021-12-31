import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:neosoft_training_tasks/src/ui/Training_task_4/models/models.dart';

class QuoteApiClient {
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  final http.Client? httpClient;

  QuoteApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<Quote>> fetchQuote() async {
    final url = '$_baseUrl/posts';

    final response = await this.httpClient!.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw new Exception('error getting quotes');
    }

    final List<dynamic> list = jsonDecode(response.body);

    final items = list.map((e) => Quote.fromJSON(e)).toList();

    return items;
  }
}
