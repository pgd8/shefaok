import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/tabs/add_time.dart';
import 'package:shefa2ok/tabs/check_tab.dart';
import 'package:shefa2ok/tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedIconTheme: IconThemeData(size: 34.sp),
        selectedItemColor: MyTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        elevation: 0,
        enableFeedback: false,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "فحص"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded), label: "إضافة"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "الاعدادات"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: "شات بوت"),
        ],
      ),
      body: tabs[index],

    );
  }

  List<Widget> tabs = [
    Container(),
    CheckTab(),
    const AddTimeTap(),
    SettingsTab(),
    Container(),
  ];
}
