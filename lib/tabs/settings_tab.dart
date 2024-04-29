// ignore_for_file: prefer_const_constructors

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/Screens/Edit_Profile_Screen/edit_profile_screen.dart';
import 'package:shefa2ok/Screens/auth/bloc/auth_bloc.dart';
import 'package:shefa2ok/Screens/login_or_register/login_or_register_view.dart';
import 'package:shefa2ok/Screens/login_or_register/widgets/login_tab.dart';
import 'package:shefa2ok/core/cache_service.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool firstSwitchValue = true;
  bool secondSwitchValue = true;
  bool thirdSwitchValue = true;
  bool fourthSwitchValue = true;
  late final AuthBloc bloc;
  bool isLoading = false;
  @override
  void initState() {
    bloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 0.03.sh,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xff252836))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit_rounded,
                            color: Color(0xff86CDD0),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, EditProfileScreen.routeName);
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.01.sw),
                          child: Column(
                            children: [
                              Text('اسم المريض'),
                              SizedBox(
                                height: 0.01.sh,
                              ),
                              Text(
                                '01012...............',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.04.sh,
                ),
                // SizedBox(
                //   child: TextFormField(
                //     // controller: ,
                //     validator: (value) {},
                //     onChanged: (value) {},
                //     decoration: InputDecoration(
                //         isDense: true,
                //         hintText: 'Search',
                //         prefixIcon: Icon(Icons.search),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(15.r),
                //           borderSide: BorderSide(color: Colors.grey),
                //         )),
                //   ),
                // ),
                // SizedBox(
                //   height: 0.035.sh,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scale: 0.6,
                      child: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: Color(0xff86CDD0),
                          inactiveThumbColor: Color(0xff86CDD0),
                          inactiveTrackColor: Colors.white,
                          value: firstSwitchValue,
                          onChanged: (value) => setState(() {
                                firstSwitchValue = value;
                              })),
                    ),
                    Text(
                      ' سماحية قراءة بيانات موقعك',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 0.035.sh,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scale: 0.6,
                      child: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: Color(0xff86CDD0),
                          inactiveThumbColor: Color(0xff86CDD0),
                          inactiveTrackColor: Colors.white,
                          value: secondSwitchValue,
                          onChanged: (value) => setState(() {
                                secondSwitchValue = value;
                              })),
                    ),
                    Text(
                      ' سماحية الوصول الى الكاميرا  ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 0.035.sh,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scale: 0.6,
                      child: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: Color(0xff86CDD0),
                          inactiveThumbColor: Color(0xff86CDD0),
                          inactiveTrackColor: Colors.white,
                          value: thirdSwitchValue,
                          onChanged: (value) => setState(() {
                                thirdSwitchValue = value;
                              })),
                    ),
                    Text(
                      ' سماحية الوصول الى الصور  ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 0.035.sh,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scale: 0.6,
                      child: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: Color(0xff86CDD0),
                          inactiveThumbColor: Color(0xff86CDD0),
                          inactiveTrackColor: Colors.white,
                          value: fourthSwitchValue,
                          onChanged: (value) => setState(() {
                                fourthSwitchValue = value;
                              })),
                    ),
                    Text(
                      ' سماحية قراءة الوقت    ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 0.035.sh,
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is SignOutLoading) {
                      isLoading = true;
                    } else if (state is SignOutSuccess) {
                      isLoading = false;
                      CacheService.clearData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginOrRegisterView()),
                      );
                    } else if (state is SignOutFailure) {
                      isLoading = false;
                      BotToast.showText(
                        text: state.errorMsg!,
                      );
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      bloc.add(SignOutEvent());
                    },
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xff86CDD0),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xff86CDD0))),
                        child: Center(
                            child: Text(
                          'تسجيل الخروج',
                          style: TextStyle(color: Colors.white),
                        ))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
