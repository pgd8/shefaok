import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/Screens/add_time/add_time.dart';
import 'package:shefa2ok/Screens/add_time/cubit/for_add_cubit.dart';
import 'package:shefa2ok/Screens/home/view/home_view.dart';
import 'package:shefa2ok/Screens/check/check_tab.dart';
import 'package:shefa2ok/tabs/settings_tab.dart';

class TabView extends StatefulWidget {
  static const String routeName = "Home Screen";

  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
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
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.chat_bubble_outline), label: "شات بوت"),
        ],
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [
    const HomeView(),
    CheckTab(),
    BlocProvider<ForAddCubit>(
      create: (context) => ForAddCubit()..fetchMedicineData(),
      child: const AddTimeTap(),
    ),
    const SettingsTab(),
    // Container(),
  ];
}
