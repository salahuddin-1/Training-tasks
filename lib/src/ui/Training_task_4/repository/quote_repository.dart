import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/models/models.dart';

import 'quote_api_client.dart';

class QuoteRepository {
  final QuoteApiClient? quoteApiClient;

  QuoteRepository({@required this.quoteApiClient})
      : assert(quoteApiClient != null);

  Future<List<Quote>> fetchQuote() async {
    return await quoteApiClient!.fetchQuote();
  }
}
