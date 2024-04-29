import 'package:flutter/material.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Password/Create_Password_Components/create_password_form.dart';

class CreatePasswordScreen extends StatelessWidget {
  static const String routeName = "Create Password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(child: CreatePasswordForm()),
    );
  }
}
