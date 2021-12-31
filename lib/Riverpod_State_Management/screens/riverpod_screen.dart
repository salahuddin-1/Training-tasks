import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neosoft_training_tasks/Riverpod_State_Management/screens/riverpod_screen2.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';
import 'package:neosoft_training_tasks/src/resources/navigation.dart';

final numberProvider = Provider<int>(
  (ref) {
    return 42;
  },
);

final numberStateProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

class RiverPodScreen extends ConsumerWidget {
  const RiverPodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final number = watch(numberProvider);
    final numberState = watch(numberStateProvider).state;

    return Scaffold(
      appBar: AppBar(
        title: Text('State Management using Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$numberState"),
            ElevatedButton(
              onPressed: () {
                Push(
                  context,
                  pushTo: RiverpodScreen2(),
                );
              },
              child: Text("Push to screen 2"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CYAN,
        onPressed: () {
          increment(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void increment(BuildContext context) {
    context.read(numberStateProvider).state++;
  }
}
