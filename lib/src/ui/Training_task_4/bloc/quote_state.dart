import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '/src/ui/Training_task_4/models/models.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteEmpty extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final List<Quote>? quote;

  const QuoteLoaded({@required this.quote}) : assert(quote != null);

  @override
  List<Object> get props => [quote!];
}

class QuoteError extends QuoteState {}
