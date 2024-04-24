import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameField extends  StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            'الاسم ',
          ),
        ),
        TextFormField(
          onChanged: (value) {},
          // controller: controller,
          keyboardType: TextInputType.name,
          decoration:  InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
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
