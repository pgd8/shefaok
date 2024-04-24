import 'package:flutter/material.dart';
import 'package:shefa2ok/Screens/Verification_Screen/Verification_Components/verification_form.dart';

class VerificationScreen extends StatelessWidget {
  static const String routeName = "Verification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // تحديد لون الخلفية للـ AppBar
        iconTheme: IconThemeData(color: Colors.black), // تحديد لون الأيقونات
      ),
      body: VerificationCodeForm(),
    );
  }
}
