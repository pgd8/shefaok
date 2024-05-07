import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart' as intll;

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();
  init() async {
    _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );
    tz.initializeTimeZones();
    await requestNotificationPermissions();
  }

  Future<void> requestNotificationPermissions() async {
    final PermissionStatus status = await Permission.notification.request();
    if (!status.isGranted) {
      // Handle case where permissions were not granted
      print('Notification permissions not granted.');
    }
  }

  static schedueledNotification(
      String title, String body, String timeString) async {
    final intll.DateFormat format = intll.DateFormat('hh:mm a');
    final DateTime time = format.parse(timeString);
    final DateTime now = DateTime.now();
    DateTime scheduledDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    if (scheduledDateTime.isBefore(now)) {
      scheduledDateTime = scheduledDateTime.add(const Duration(days: 1));
    }
    var androidDetails = const AndroidNotificationDetails(
      'important_notifications',
      'My Channel',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iosDetails = const DarwinNotificationDetails();
    var notificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    await _notification.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduledDateTime,
          tz.local), //.now(tz.local).add(const Duration(seconds: 10)),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
    print('notificationDetails');
  }
}

Future<void> handleFCMMessage(Map<String, dynamic> medicine) async {
  NotificationHelper.schedueledNotification(
    'Medicine Reminder',
    "It's time to take ${medicine['medicine'].toString()}",
    medicine['time'],
  );
}

void configureFirebaseMessaging() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    handleFCMMessage(message.data);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    handleFCMMessage(message.data);
  });
}
