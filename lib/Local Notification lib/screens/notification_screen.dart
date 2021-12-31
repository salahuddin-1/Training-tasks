import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/Biometric%20Authentication%20lib/local_auth_screen.dart';
import 'package:neosoft_training_tasks/Local%20Notification%20lib/resources/local_notification.dart';
import 'package:neosoft_training_tasks/Local%20Notification%20lib/screens/payload_screen.dart';
import 'package:neosoft_training_tasks/src/resources/navigation.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late final NotificationApi _notificationApi;

  @override
  void initState() {
    super.initState();

    _notificationApi = NotificationApi();

    _listenForNotifications();
  }

  _listenForNotifications() {
    _notificationApi.onClickedNotification.listen(
      (payload) => _onClickedNotifications(payload),
    );
  }

  _onClickedNotifications(String? payload) {
    Push(
      context,
      pushTo: PayloadScreen(
        payload: payload ?? "payload is null",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(
              onPressed: () => _notificationApi.showNotification(
                title: "Simple Notification",
                body: "Body of simple notification",
                payload: "Payload",
              ),
              title: "Simple Notification",
            ),
            MyButton(
              onPressed: () {
                _notificationApi.showScheduledNotification(
                  title: "Scheduled Notification",
                  body: "Body of scheduled notification",
                  payload: "Payload",
                  scheduledDate: DateTime.now().add(
                    Duration(seconds: 3),
                  ),
                );

                _showDialog("Scheduled Notification after 3 seconds");
              },
              title: "Scheduled Notification",
            ),
            MyButton(
              onPressed: () {
                _notificationApi.showScheduledAtSpecificTimeNotification(
                  title: "Scheduled Notification by (Time)",
                  body: "Body of scheduled notification at a given time",
                  payload: "Payload",
                );

                _showDialog('Notification set for 8 : 00 pm');
              },
              title: "Scheduled Notification  by (Time)",
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _notificationApi.dispose();
    super.dispose();
  }

  _showDialog(String text) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
        );
      },
    );
  }
}
