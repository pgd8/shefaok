import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Password/create_password_screen.dart';

class VerificationCodeForm extends StatefulWidget {
  @override
  _VerificationCodeFormState createState() => _VerificationCodeFormState();
}

class _VerificationCodeFormState extends State<VerificationCodeForm> {
  List<TextEditingController> controllers =
  List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    controllers.forEach((controller) => controller.dispose());
    focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,designSize: const Size(390, 844));
    return Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 0.04.sh),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ادخل رمز التحقق',
              style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 0.02.sh), // Increased height here
            Text(
              'لقد أرسلنا رمز التحقق إلى رقمك',
              style: TextStyle(
                fontSize: 14.0.sp,
                color: Colors.grey, // تحديد لون النص هنا
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 0.2.sh), // Increased height here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                    (index) => SizedBox(
                  width: 0.17.sw,
                  child: TextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(
                                0xFF86CDD0)), // تحديد لون الحدود بعد الفوكس هنا
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index + 1]);
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index - 1]);
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 250 - 173), // Increased height here
            ElevatedButton(
              onPressed: () {
                // Add verification logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreatePasswordScreen(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF86CDD0)), // Set the button color here
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 0.04.sh,
                    vertical: 0.02.sw), // Change the values as needed
                child: Text(
                  'تأكيد',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0.sp,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
