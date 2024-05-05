import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Account/create_account_screen.dart';

class RegisterTab extends StatelessWidget {
  const RegisterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.02.sh,
            ),
            const Text(
              'اهلا بك',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccountScreen(),
                  ),
                );
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black87)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_outlined),
                    SizedBox(
                      width: 18,
                    ),
                    Text('إنشاء حساب برقم الهاتف')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
