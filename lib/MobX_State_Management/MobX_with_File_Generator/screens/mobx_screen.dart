import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:neosoft_training_tasks/MobX_State_Management/MobX_with_File_Generator/resources/counter.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';

class MobXScreenUsingGenerator extends StatefulWidget {
  const MobXScreenUsingGenerator({Key? key}) : super(key: key);

  @override
  _MobXScreenUsingGeneratorState createState() =>
      _MobXScreenUsingGeneratorState();
}

class _MobXScreenUsingGeneratorState extends State<MobXScreenUsingGenerator> {
  late CounterStore _counterObservable;

  @override
  void initState() {
    super.initState();

    _counterObservable = CounterStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MobX State Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Increment Counter',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Observer(builder: (context) {
              return Text(
                "${_counterObservable.counter}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CYAN,
        onPressed: () {
          _counterObservable.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
