import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService() {
    _initialise();
  }

  static final _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void _initialise() {
    final initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings(
      'my_app_icon',
    ));

    _notificationsPlugin.initialize(initializationSettings);
  }

  // SIMPLE NOTIFICATION
  static Future<void> showNotification(RemoteMessage message) async {
    int id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    return _notificationsPlugin.show(
      id,
      message.notification!.title,
      message.notification!.body,
      await _notificationDetails(),
    );
  }

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        // Channel id declared in Android manifest
        'fcm_notifications',
        'fcm_notifications name',
        channelDescription: 'channel description',
        importance: Importance.max,
        priority: Priority.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
}
