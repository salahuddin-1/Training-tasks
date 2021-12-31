import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:neosoft_training_tasks/MobX_State_Management/MobX/resources/counter.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';

class MobXScreen extends StatefulWidget {
  const MobXScreen({Key? key}) : super(key: key);

  @override
  _MobXScreenState createState() => _MobXScreenState();
}

class _MobXScreenState extends State<MobXScreen> {
  late Counter _counterObservable;

  @override
  void initState() {
    super.initState();

    _counterObservable = Counter();
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
                "${_counterObservable.counter.value}",
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
          _counterObservable.increment.call();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
