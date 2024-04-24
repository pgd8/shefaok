// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/Screens/Forgot_Password/forgot_password.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash Screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    routeToLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(340, 844));
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: Center(
        child: Container(
          width: 0.9.sw,
          height: 0.6.sh,
          child: Image.asset("assets/images/Logo.png"),
        ),
      ),
    );
  }

  void routeToLogin() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ForgotPasswordScreen(),
          ));
    });
  }
}
