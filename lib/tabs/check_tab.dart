import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/Screens/Scan_Screen/search.dart';
import 'package:shefa2ok/Screens/Writting_Screen/writing_screen.dart';

class CheckTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'اختر طريقة البحث الخاصة بك',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        SizedBox(height: 0.1.sh),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, WritingScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyTheme.primaryColor, // تغيير اللون هنا
              minimumSize: Size(0.8.sw, 0.08.sh), // تغيير عرض الزرار هنا
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.create, color: Colors.white),
                SizedBox(width: 0.02.sw),
                Text(
                  'كتابة',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 0.03.sh), // زيادة المسافة بين الأزرار
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Search.routeName);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyTheme.primaryColor, // تغيير اللون هنا
              minimumSize: Size(0.8.sw, 0.08.sh), // تغيير عرض الزرار هنا
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.scanner, color: Colors.white),
                SizedBox(width: 0.02.sw),
                Text(
                  'مسح',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
