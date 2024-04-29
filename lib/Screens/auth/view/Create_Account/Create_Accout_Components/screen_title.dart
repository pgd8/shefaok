// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text('انشاء حساب'),
        SizedBox(
          height: 0.01.sh,
        ),
        const Text(
          'الرجاء إدخال بياناتك ويمكنك تغييرها مرة أخرى من داخل الإعدادات',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    ));
  }
}
