import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumFieldPr extends StatelessWidget {
  const PhoneNumFieldPr({super.key});

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
          height: 0.02.sh,
        ),
        TextFormField(
          onChanged: (value) {},
          // controller: controller,
          keyboardType: TextInputType.phone,

          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              hintText: 'ادخل رقم هاتفك',
              hintTextDirection: TextDirection.rtl),
          validator: (value) {},
          obscureText: false,
        ),
      ],
    );
  }
}
