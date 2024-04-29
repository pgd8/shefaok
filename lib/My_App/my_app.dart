import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Account/create_account_screen.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Password/create_password_screen.dart';
import 'package:shefa2ok/Screens/Edit_Profile_Screen/edit_profile_screen.dart';
import 'package:shefa2ok/Screens/Forgot_Password/forgot_password.dart';
import 'package:shefa2ok/Screens/Home_Screen/home_screen.dart';
import 'package:shefa2ok/Screens/Scan_Screen/search.dart';
import 'package:shefa2ok/Screens/Splash_Screen/splash_screen.dart';
import 'package:shefa2ok/Screens/Verification_Screen/verification_screen.dart';
import 'package:shefa2ok/Screens/Writting_Screen/writing_screen.dart';
import 'package:shefa2ok/Screens/login_or_register/login_or_register_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      ensureScreenSize: true,
      minTextAdapt: true,
      builder: (_, context) { BotToastInit();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Shefaok",
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
            VerificationScreen.routeName: (context) => VerificationScreen(),
            CreatePasswordScreen.routeName: (context) => CreatePasswordScreen(),
            CreateAccountScreen.routeName: (context) => CreateAccountScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            Search.routeName : (context) => const Search(),
            WritingScreen.routeName : (context) => const WritingScreen(),
            EditProfileScreen.routeName :(context) => EditProfileScreen(),
            LoginOrRegisterView.routeName:(context) => const LoginOrRegisterView(),
          },
        );
      },
    );
  }
}
