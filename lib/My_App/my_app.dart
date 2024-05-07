import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Account/create_account_screen.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Password/create_password_screen.dart';
import 'package:shefa2ok/Screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:shefa2ok/Screens/tabs/tab_view.dart';
import 'package:shefa2ok/Screens/splash/splash_screen.dart';
import 'package:shefa2ok/Screens/auth/view/login_or_register/login_or_register_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (_, context) {
        return MaterialApp(
          builder: BotToastInit(),
          debugShowCheckedModeBanner: false,
          title: "Shefaok",
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            CreatePasswordScreen.routeName: (context) => CreatePasswordScreen(),
            CreateAccountScreen.routeName: (context) =>
                const CreateAccountScreen(),
            TabView.routeName: (context) => const TabView(),
            EditProfileScreen.routeName: (context) => EditProfileScreen(),
            LoginOrRegisterView.routeName: (context) =>
                const LoginOrRegisterView(),
          },
        );
      },
    );
  }
}
