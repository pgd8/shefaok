import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumField extends StatelessWidget {
  const PhoneNumField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
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
          validator: (value) {},
          obscureText: false,
        ),
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
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
          keyboardType: TextInputType.phone,

          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: 'رقم السري',
              hintTextDirection: TextDirection.rtl),
          validator: (value) {},
          obscureText: false,
        ),
      ],
    );
  }
}
