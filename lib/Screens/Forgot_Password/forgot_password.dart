import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/Screens/Verification_Screen/verification_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "Forgot Password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            Text(
              ' نسيت كلمة المرور ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 0.07.sh),
            Text(
              'ادخل رقم الهاتف الخاص بك ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0.sp),
            ),
            SizedBox(height: 0.03.sh),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                labelText: '+20 | رقم الهاتف: 0xxxxxxxxxxx',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                ),
              ),
            ),
            SizedBox(height: 0.1.sh),
            ElevatedButton(
              onPressed: () {
                // تنفيذ منطق إعادة تعيين كلمة المرور هنا
                // على سبيل المثال، إرسال بريد إلكتروني لإعادة تعيين كلمة المرور
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationScreen(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                    Text('تم إرسال رمز التحقق لإعادة تعيين كلمة المرور'),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF86CDD0)), // تعيين لون الزر هنا
              ),
              child: Text(
                'ارسال',
                style: TextStyle(color: Colors.white), // تعيين لون النص هنا
              ),
            ), // <-- add closing parenthesis here
          ],
        ),
      ),
    );
  }
}
