import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/Screens/auth/view/login_or_register/widgets/tab_bar_widget.dart';

class LoginOrRegisterView extends StatelessWidget {
  const LoginOrRegisterView({super.key});
  static const String routeName = "Login Or Register Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(top: 49, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: MyTheme.primaryColor,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/Logo.png'))),
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              const Expanded(child: TabBarWidget())
            ],
          ),
        ),
      ),
    );
  }
}
