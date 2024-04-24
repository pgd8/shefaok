// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderFieldPr extends StatefulWidget {
  @override
  State<GenderFieldPr> createState() => _GenderFieldPrState();
}

class _GenderFieldPrState extends State<GenderFieldPr> {
  String dropdownValue = 'ذكر';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            'النوع',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 0.02.sh,
        ),
        DropdownButtonFormField<String>(
          isExpanded: true,
          hint: const Text(
            ' Select Gender',
          ),
          borderRadius: BorderRadius.circular(8),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey))),
          itemHeight: 0.1.sh,
          // Step 3.
          value: dropdownValue,
          // Step 4.
          items: <String>['ذكر', 'أنثى']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          // Step 5.
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
        ),
      ],
    );
  }
}
