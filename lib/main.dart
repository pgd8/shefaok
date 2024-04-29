import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_app.dart';
import 'package:shefa2ok/Screens/auth/bloc/auth_bloc.dart';
import 'package:shefa2ok/core/cache_service.dart';
import 'package:shefa2ok/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  CacheService.init();
  await ScreenUtil.ensureScreenSize();
  // if (CacheService.getData(
  //       key: 'authed',
  //     ) ==
  //     null) {
  //   CacheService.setData(key: 'authed', value: false);
  // }
  runApp(BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(),
    child: const MyApp(),
  ));
}
