import 'package:flutter/material.dart';
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/Screens/login_or_register/widgets/login_tab.dart';
import 'package:shefa2ok/Screens/login_or_register/widgets/register_tab.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.97,
                decoration: BoxDecoration(
                  // color: MyTheme.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.black87,
                  // indicator: BoxDecoration(
                  //   // borderRadius: BorderRadius.circular(
                  //   //   25.0,
                  //   // ),
                  //   color: MyTheme.primaryColor,
                  // ),
                  indicatorColor: MyTheme.primaryColor,
                  tabs: [
                    Tab(
                      child: selectedIndex == 0
                          ? const Text(
                              'تسجيل دخول',
                              style: TextStyle(
                                  fontSize: 16, color: MyTheme.primaryColor),
                            )
                          : const Text(
                              'تسجيل دخول',
                              style: TextStyle(fontSize: 14),
                            ),
                    ),
                    Tab(
                      child: selectedIndex == 1
                          ? const Text(
                              'إنشاء حساب',
                              style: TextStyle(
                                  fontSize: 16, color: MyTheme.primaryColor),
                            )
                          : const Text(
                              'إنشاء حساب',
                              style: TextStyle(fontSize: 14),
                            ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    LoginTab(),
                    RegisterTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
