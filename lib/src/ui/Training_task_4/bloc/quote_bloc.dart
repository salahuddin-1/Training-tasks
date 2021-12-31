import 'package:bloc/bloc.dart';

import 'package:neosoft_training_tasks/src/ui/Training_task_4/bloc/quote_event.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/bloc/quote_state.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/models/models.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/repository/repository.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteRepository repository;

  // The initial state
  QuoteBloc({
    required this.repository,
  }) : super(QuoteEmpty());

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if (event is FetchQuote) {
      yield QuoteLoading();

      try {
        final List<Quote> quote = await repository.fetchQuote();
        yield QuoteLoaded(quote: quote);
      } catch (e) {
        yield QuoteError();
      }
    }
  }
}
