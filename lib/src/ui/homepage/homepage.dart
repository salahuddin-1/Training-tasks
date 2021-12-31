import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/bloc/quote_bloc.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/repository/quote_api_client.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/repository/repository.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/ui/network_calls_using_flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late QuoteRepository repository;

  @override
  void initState() {
    repository = QuoteRepository(
      quoteApiClient: QuoteApiClient(
        httpClient: http.Client(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteBloc(repository: repository),
      child: NetworkCallsUsingFlutterBloc(),
    );
  }
}
