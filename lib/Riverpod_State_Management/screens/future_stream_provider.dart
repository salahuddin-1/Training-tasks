import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';
import 'package:neosoft_training_tasks/src/widgets/circular_progress.dart';
import 'package:riverpod/riverpod.dart';

final futureProvider = FutureProvider<int>((ref) {
  return Future<int>.delayed(
    Duration(seconds: 4),
  ).then(
    (value) => Future.value(10),
  );
});

final streamProvider = StreamProvider<int>((ref) {
  return Stream.value(10);
});

class RiverpodFutureStreamProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //
    final streamNumber = watch(streamProvider);
    final futureNumber = watch(futureProvider);
    //

    return Scaffold(
      appBar: appBar('Riverpod Stream & Future Provider'),
      body: Center(
        // Same for future provider
        // as both are async
        child: futureNumber.when(
          data: (data) => Text(data.toString()),
          loading: () => circularProgress(),
          error: (err, _) => Text(err.toString()),
        ),
      ),
    );
  }
}
