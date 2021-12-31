import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:neosoft_training_tasks/FCM%20lib/resources/local_notification_servie.dart';
import 'package:neosoft_training_tasks/FCM%20lib/screens/red_screen.dart';

// Paste This in AndroidManifest

// <meta-data
// android:name="com.google.firebase.messaging.default_notification_channel_id"
// android:value="@string/default_notification_channel_id" />

class FCMScreen extends StatefulWidget {
  const FCMScreen({Key? key}) : super(key: key);

  @override
  _FCMScreenState createState() => _FCMScreenState();
}

class _FCMScreenState extends State<FCMScreen> {
  @override
  void initState() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => RedScreen()));
      }
    });

    // Foreground
    FirebaseMessaging.onMessage.listen(
      (message) {
        print(message.notification!.title);
        print(message.notification!.body);

        LocalNotificationService.showNotification(message);
      },
    );

    // WHen App is in background
    // and user taps
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // This is the key value that you'll be passing from FCM console
      final data = message.data['route'];

      Navigator.push(context, MaterialPageRoute(builder: (_) => RedScreen()));

      print(data);
      print('On Message Opened');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FCM Notifications"),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

// Called when app is in background
callFCMbackgrounfMessageHandler() {
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
}

// This should be a top level
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data);
  print(message.notification!.title);
}
