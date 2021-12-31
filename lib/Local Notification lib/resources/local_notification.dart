import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationApi {
  NotificationApi() {
    tz.initializeTimeZones();
    init();
  }

  static final _notifications = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // In res/drawable paste an icon of your choice
    // Write only the name of icon without extension
    final initializationSettingsAndroid = AndroidInitializationSettings(
      'my_app_icon',
    );

    final initializationSettingsIOS = IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: (val, a, b, c) {},
    );

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: null,
    );

    await _notifications.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );

    // Do this for scheduled notifiations
    final locationName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(locationName));
  }

  Future<void> selectNotification(String? payload) async {
    //Handle notification tapped logic here

    onClickedNotification.add(payload);
    print(payload);
  }

  // SIMPLE NOTIFICATION
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    return _notifications.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }

  // SCHEDULED NOTIFICATIONS
  Future<void> showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async {
    return _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      await _notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  // Schedule notification at Time
  Future<void> showScheduledAtSpecificTimeNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    return _notifications.zonedSchedule(
      id,
      title,
      body,
      // Setting notification at given time
      _scheduleDaily(
        Time(18, 19, 10),
      ),
      await _notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  tz.TZDateTime _scheduleDaily(Time time) {
    // We are passing time as the paramter
    // time = setted time for current day like 8:28 am or anything

    // now = notification for current date
    final now = DateTime.now();

    final scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      time.second,
    );

    print(scheduledDate);
    if (scheduledDate.isBefore(now)) {
      // That means user has selected a past date
      // now how can a notification be displayed if it is
      // set in the past
      print('Past');
      return scheduledDate.add(Duration(days: 1));
    }

    return scheduledDate;
  }

  Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        channelDescription: 'channel description',
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  final onClickedNotification = BehaviorSubject<String?>();

  void dispose() {
    onClickedNotification.close();
  }
}
