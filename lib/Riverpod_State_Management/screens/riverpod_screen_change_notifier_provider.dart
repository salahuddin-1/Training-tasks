import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neosoft_training_tasks/Riverpod_State_Management/resources/change_notifier_provider.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';

final numberChangeNotifier = ChangeNotifierProvider<NumberChangeNotifier>(
  (ref) {
    return NumberChangeNotifier();
  },
);

class RiverpodScreenChangeRiverpodNotifier extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final numberChangeNotifierProvider = watch(numberChangeNotifier);

    return Scaffold(
        appBar: AppBar(
          title: Text('Riverpod Change Notifier Provider'),
        ),
        body: ListView.builder(
          itemCount: numberChangeNotifierProvider.numbers.length,
          itemBuilder: (context, index) {
            return Text(
              numberChangeNotifierProvider.numbers[index].toString(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: CYAN,
          onPressed: () {
            numberChangeNotifierProvider.addNumber(2);
          },
          child: Icon(Icons.add),
        ));
  }
}
