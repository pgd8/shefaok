// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/Screens/Create_Account/Create_Accout_Components/screen_title.dart';
import 'package:shefa2ok/Screens/Edit_Profile_Screen/Edit_Profile_Components/birthdate_field_pr.dart';
import 'package:shefa2ok/Screens/Edit_Profile_Screen/Edit_Profile_Components/gender_field_pr.dart';
import 'package:shefa2ok/Screens/Edit_Profile_Screen/Edit_Profile_Components/name_field_pr.dart';
import 'package:shefa2ok/Screens/Edit_Profile_Screen/Edit_Profile_Components/phone_num_field_pr.dart';
import 'package:shefa2ok/Screens/Home_Screen/home_screen.dart';

import 'Edit_Profile_Components/add_image_pr.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = "Edit Profile";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                CreateAccountScreenTitle(),
                const AddImagePr(),
                SizedBox(
                  height: 0.02.sh,
                ),
                NameFieldPr(),
                SizedBox(
                  height: 0.02.sh,
                ),
                const PhoneNumFieldPr(),
                const BirthDateFieldPr(),
                GenderFieldPr(),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  color: MyTheme.primaryColor,
                  child: const Center(
                      child: Text(
                    'تم',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
