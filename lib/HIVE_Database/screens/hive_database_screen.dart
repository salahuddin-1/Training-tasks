import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:neosoft_training_tasks/HIVE_Database/resources/initialise_hive.dart';
import 'package:neosoft_training_tasks/HIVE_Database/resources/todo_model.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';
import 'package:neosoft_training_tasks/src/resources/navigation.dart';
import 'package:neosoft_training_tasks/src/widgets/appbar.dart';
import 'package:neosoft_training_tasks/src/widgets/circular_progress.dart';

class HiveDatabaseScreen extends StatefulWidget {
  const HiveDatabaseScreen({Key? key}) : super(key: key);

  @override
  _HiveDatabaseScreenState createState() => _HiveDatabaseScreenState();
}

class _HiveDatabaseScreenState extends State<HiveDatabaseScreen> {
  late Box<TodoModel> todoBox;
  late TextEditingController titleController;
  late TextEditingController detailController;

  @override
  void initState() {
    super.initState();

    todoBox = Hive.box(todoBoxName);
    titleController = TextEditingController();
    detailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("HIVE Database"),
      body: ValueListenableBuilder(
        valueListenable: todoBox.listenable(),
        builder: (context, Box<TodoModel> todoModel, _) {
          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final keys = todoModel.keys.map((key) => key as int).toList();
              final value = todoModel.get(keys[index]);
              final key = keys[index];

              return ListTile(
                title: Text(value!.title),
                subtitle: Text(value.detail),
                leading: Text(keys[index].toString()),
                trailing: value.completed
                    ? Icon(Icons.check, color: Colors.green)
                    : SizedBox.shrink(),
                onTap: () {
                  _markAsCompleted(key, value);
                },
                onLongPress: () {
                  _delete(key);
                },
              );
            },
            separatorBuilder: (_, i) => Divider(color: Colors.black),
            itemCount: todoBox.length,
          );
        },
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: CYAN,
      onPressed: _showDialog,
      child: Icon(Icons.add),
    );
  }

  _showDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                  ),
                  TextField(
                    controller: detailController,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Submit'),
                  )
                ],
              ),
            ),
          );
        });
  }

  _markAsCompleted(dynamic key, TodoModel value) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextButton(
                onPressed: () {
                  TodoModel todoModel = TodoModel(
                    title: value.title,
                    detail: value.detail,
                    completed: true,
                  );
                  todoBox.put(key, todoModel);
                  Pop(context);
                },
                child: Text("Mark as completed"),
              ),
            ),
          );
        });
  }

  _delete(dynamic key) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextButton(
                onPressed: () {
                  todoBox.delete(key);
                  Pop(context);
                },
                child: Text("Delete",
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
            ),
          );
        });
  }

  _submit() {
    String title = titleController.text;
    String detail = detailController.text;

    TodoModel todoModel = TodoModel(
      title: title,
      detail: detail,
      completed: false,
    );

    // Adds and auto-increments the key
    todoBox.add(todoModel);

    Pop(context);
  }
}
