import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/Screens/Home_Screen/home_screen.dart';
import 'package:shefa2ok/Screens/login_or_register/login_or_register_view.dart';
import 'package:shefa2ok/core/cache_service.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash Screen";

  const SplashScreen({super.key});

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
        child: SizedBox(
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
            builder: (context) =>
                CacheService.getData(key: 'authed') == false ||
                        CacheService.getData(
                              key: 'authed',
                            ) ==
                            null
                    ? const LoginOrRegisterView()
                    : HomeScreen(),
          ));
    });
  }
}
