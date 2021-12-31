import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neosoft_training_tasks/src/constants/colors.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/bloc/bloc.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/bloc/quote_state.dart';
import 'package:neosoft_training_tasks/src/ui/Training_task_4/models/models.dart';
import 'package:neosoft_training_tasks/src/widgets/circular_progress.dart';

class NetworkCallsUsingFlutterBloc extends StatefulWidget {
  @override
  _NetworkCallsUsingFlutterBlocState createState() =>
      _NetworkCallsUsingFlutterBlocState();
}

class _NetworkCallsUsingFlutterBlocState
    extends State<NetworkCallsUsingFlutterBloc> {
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
        "Network calls using flutter_bloc",
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
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        if (state is QuoteEmpty) {
          BlocProvider.of<QuoteBloc>(context).add(FetchQuote());
        }
        if (state is QuoteError) {
          return Center(
            child: Text("Failed to fetch data"),
          );
        }
        if (state is QuoteLoaded) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            itemCount: state.quote!.length,
            itemBuilder: (context, index) {
              final quote = state.quote![index];

              return Column(
                children: [
                  _information(quote),
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

  Widget _information(Quote model) {
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
