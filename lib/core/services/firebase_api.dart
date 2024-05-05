import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessegingBackgroundHandler(RemoteMessage message) async {
  print('Handling background message: ${message.messageId}');
}

class FirebaseApi {
  final _firebaseMesseging = FirebaseMessaging.instance;
  // void handleMessage(RemoteMessage? message) {
  //   if (message == null) return;navigatorKey.curr
  // }

  Future<void> initNotification() async {
    await _firebaseMesseging.requestPermission();
    final fcmToken = await _firebaseMesseging.getToken();
    NotificationSettings settings = await _firebaseMesseging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
    print('token\n$fcmToken');
    FirebaseMessaging.onBackgroundMessage(_firebaseMessegingBackgroundHandler);
  }
}
