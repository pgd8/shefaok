import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumField extends StatelessWidget {
  const PhoneNumField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Text(
              'رقم الهاتف',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 0.005.sh,
          ),
          TextFormField(
            onChanged: (value) {},
            controller: controller,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: 'رقم هاتفك',
                hintTextDirection: TextDirection.rtl),
            validator: (value) {
              String pattern = r'(^0[0-9]{10}$)';
              RegExp regExp = RegExp(pattern);
              if (value!.isEmpty) {
                return 'برجاء إدخال رقم هاتفك';
              } else if (!regExp.hasMatch(value)) {
                return 'برجاء إدخال رقم هاتف صحيح';
              } else if (value.length < 10) {
                return 'برجاء إدخال رقم هاتف صحيح';
              }
              return null;
            },
            obscureText: false,
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Text(
              'رقم السري',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 0.005.sh,
          ),
          TextFormField(
            onChanged: (value) {},
            controller: controller,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: 'رقم السري',
                hintTextDirection: TextDirection.rtl),
            validator: (value) {
              if (value != null) {
                bool isPasswordValid(String password) {
                  RegExp regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).{6,}$');
                  return regex.hasMatch(password);
                }

                if (isPasswordValid(value)) {
                  return null;
                } else {
                  return "يجب أن يحتوي علي أحرف وأرقام ولا يقل طوله عن 6 رموز";
                }
              } else {
                return "يجب أن يحتوي علي أحرف وأرقام ولا يقل طوله عن 6 رموز";
              }
            },
            obscureText: false,
          ),
        ],
      ),
    );
  }
}
