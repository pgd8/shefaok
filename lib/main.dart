import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_app.dart';
import 'package:shefa2ok/Screens/auth/bloc/auth_bloc.dart';
import 'package:shefa2ok/core/services/cache_service.dart';
import 'package:shefa2ok/core/services/firebase_api.dart';
import 'package:shefa2ok/firebase_options.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // final fcmToken = await FirebaseMessaging.instance.getToken();

  CacheService.init();
  await FirebaseApi().initNotification();
  await ScreenUtil.ensureScreenSize();
  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );

  // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //   print('User granted permission');
  // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  //   print('User granted provisional permission');
  // } else {
  //   print('User declined or has not accepted permission');
  // }
  runApp(BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(),
    child: const MyApp(),
  ));
}
