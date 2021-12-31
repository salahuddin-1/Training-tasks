import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neosoft_training_tasks/Riverpod_State_Management/screens/riverpod_screen.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';

class RiverpodScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, watch, child) {
              final number = watch(numberStateProvider).state;
              return Text("$number");
            })
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
