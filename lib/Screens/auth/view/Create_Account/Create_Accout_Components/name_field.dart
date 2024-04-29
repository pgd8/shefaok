import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topRight,
          child: Text(
            'الاسم ',
          ),
        ),
        SizedBox(
          height: 0.005.sh,
        ),
        TextFormField(
          onChanged: (value) {},
          controller: controller,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              hintText: 'ادخل الاسم',
              hintTextDirection: TextDirection.rtl),
          validator: (value) {},
          obscureText: false,
        ),
      ],
    );
  }
}
