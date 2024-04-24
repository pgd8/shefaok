// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/Screens/Edit_Profile_Screen/edit_profile_screen.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  bool firstSwitchValue = true;
  bool secondSwitchValue = true;
  bool thirdSwitchValue = true;
  bool fourthSwitchValue = true;

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
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
                SizedBox(
                  child: TextFormField(
                    // controller: ,
                    validator: (value) {},
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.grey),
                        )),
                  ),
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
                          value: widget.firstSwitchValue,
                          onChanged: (value) => setState(() {
                                widget.firstSwitchValue = value;
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
                          value: widget.secondSwitchValue,
                          onChanged: (value) => setState(() {
                                widget.secondSwitchValue = value;
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
                          value: widget.thirdSwitchValue,
                          onChanged: (value) => setState(() {
                                widget.thirdSwitchValue = value;
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
                          value: widget.fourthSwitchValue,
                          onChanged: (value) => setState(() {
                                widget.fourthSwitchValue = value;
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
                SizedBox(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Color(0xff86CDD0),
                    child: Center(
                        child: Text(
                      'تسجيل الخروج',
                      style: TextStyle(color: Colors.white),
                    )),
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
