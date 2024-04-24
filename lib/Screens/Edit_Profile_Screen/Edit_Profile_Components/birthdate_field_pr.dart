import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';

class BirthDateFieldPr extends StatefulWidget {
  const BirthDateFieldPr({super.key});

  @override
  State<BirthDateFieldPr> createState() => _BirthDateFieldPrState();
}

class _BirthDateFieldPrState extends State<BirthDateFieldPr> {
  List<DateTime?> _dates = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(
            'تاريخ ميلادك ',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 0.02.sh,
        ),
        CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            selectedDayHighlightColor: MyTheme.primaryColor,
            calendarType: CalendarDatePicker2Type.multi,
          ),
          value: _dates,
          onValueChanged: (dates) => _dates = dates,
        )
      ],
    );
  }
}
