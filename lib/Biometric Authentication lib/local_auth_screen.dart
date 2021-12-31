import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Biometric%20Authentication%20lib/local_auth_api.dart';

class LocalAuthScreen extends StatefulWidget {
  const LocalAuthScreen({Key? key}) : super(key: key);

  @override
  _LocalAuthScreenState createState() => _LocalAuthScreenState();
}

class _LocalAuthScreenState extends State<LocalAuthScreen> {
  // final LocalAuthAPI _localAuthAPI = LocalAuthAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onPressed: () async {
                final isAuthenticated = await LocalAuthAPI.authenticate();

                if (isAuthenticated) {
                  showSuccess();
                }
              },
              title: "Check",
            ),
          ],
        ),
      ),
    );
  }

  showSuccess() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
          );
        });
  }
}

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;

  const MyButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Container(
        child: Text(title),
      ),
    );
  }
}
