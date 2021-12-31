import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/src/blocs/form_input_info_BLOC.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';
import 'package:neosoft_training_tasks/src/models/forms_input_model.dart';
import 'package:neosoft_training_tasks/src/resources/navigation.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_2/edit.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_2/task_2_inputs.dart';

class TaskForms extends StatefulWidget {
  @override
  _TaskFormsState createState() => _TaskFormsState();
}

class _TaskFormsState extends State<TaskForms> {
  final FormInputInfoBLOC _formInputInfoBLOC = new FormInputInfoBLOC();

  @override
  void dispose() {
    _formInputInfoBLOC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      backgroundColor: CYAN,
      floatingActionButton: _floatingActionButton(),
      body: _body(),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Text("Forms and validation"),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: White,
      child: Icon(Icons.add),
      onPressed: () {
        Push(
          context,
          pushTo: Task2Inputs(
            formInputInfoBLOC: _formInputInfoBLOC,
          ),
        );
      },
    );
  }

  _body() {
    return StreamBuilder<List<FormInputModel>>(
      stream: _formInputInfoBLOC.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var formModel = snapshot.data![index];

              return InkWell(
                splashColor: White,
                onTap: () {
                  Push(
                    context,
                    pushTo: Edit(
                      formInputInfoBLOC: _formInputInfoBLOC,
                      formInputModel: formModel.formInputModel!,
                      index: index,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    color: White,
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                            'Name :  ${formModel.firstName} ${formModel.lastName}',
                          ),
                          text('Gender :  ${formModel.gender}'),
                          text('Employment Status :  ${formModel.empStatus}'),
                          text('Qualification :  ${formModel.qualification}'),
                          text('Email :  ${formModel.email}'),
                          text('Phone no :  ${formModel.phoneNumber}'),
                          _tapToEdit(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: Text(
            "No Data",
            style: TextStyle(
              color: White,
            ),
          ),
        );
      },
    );
  }

  Container _tapToEdit() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Tap to Edit",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  text(String title) {
    return Text(
      title,
      style: TextStyle(
        height: 1.5,
        letterSpacing: 0.8,
      ),
    );
  }
}
