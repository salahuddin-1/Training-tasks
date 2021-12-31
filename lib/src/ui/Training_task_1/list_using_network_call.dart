import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/src/blocs/list_bloc.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';
import 'package:neosoft_training_tasks/src/models/list_using_network_calls_model.dart';
import 'package:neosoft_training_tasks/src/widgets/circular_progress.dart';

class ListUsingNetworkCalls extends StatefulWidget {
  @override
  _ListUsingNetworkCallsState createState() => _ListUsingNetworkCallsState();
}

class _ListUsingNetworkCallsState extends State<ListUsingNetworkCalls> {
  late final ListBLOC _listBLOC;

  @override
  void initState() {
    _listBLOC = new ListBLOC();
    super.initState();
  }

  @override
  void dispose() {
    _listBLOC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: Text(
        "Network Calls using vanilla BLOC (Rx-dart)",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: White,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.cyan[700],
    );
  }

  _body() {
    return StreamBuilder<List<ListUsingNetworkCallsModel>>(
      stream: _listBLOC.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final model = snapshot.data![index];
              return Column(
                children: [
                  _information(model),
                  SizedBox(height: 30),
                ],
              );
            },
          );
        }

        return circularProgress();
      },
    );
  }

  Widget _information(ListUsingNetworkCallsModel model) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.cyan[700],
      shadowColor: Colors.cyan[700],
      elevation: 15,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              '${model.id}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${getOnlyTheFirstLetterCapital(model.title)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${getOnlyTheFirstLetterCapital(model.body)}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getOnlyTheFirstLetterCapital(String text) {
    return "${text.substring(0, 1).toUpperCase()}${text.substring(1)}";
  }
}
