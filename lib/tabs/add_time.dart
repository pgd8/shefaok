import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTimeTap extends StatefulWidget {
  const AddTimeTap({Key? key}) : super(key: key);

  @override
  State<AddTimeTap> createState() => AddTimeTapState();
}

class AddTimeTapState extends State<AddTimeTap> {
  TextEditingController dateController = TextEditingController();
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 30);

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color.fromARGB(255, 135, 205, 206),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: const Border.fromBorderSide(BorderSide(color: Color(0xff87cdce))),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff87cdce),
                      spreadRadius: 7,
                      blurRadius: 20,
                    ),
                  ],
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff87cdce),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      height: 45.h,
                      width: 50.w,
                      child: const Icon(
                        Icons.access_time_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      _timeOfDay.format(context).toString() +
                          (_timeOfDay.period == DayPeriod.am ? ' صباحًا' : ' مساءً'),
                      style: TextStyle(
                        color: const Color(0xff87cdce),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                        child: Center(
                          child: MaterialButton(
                            onPressed: _showTimePicker,
                            color: const Color(0xff87cdce),
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'اختيار الوقت',
                                style: TextStyle(color: Colors.white, fontSize: 20.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            TextFormField(
                              controller: dateController,
                              decoration: InputDecoration(
                                icon: const Icon(
                                  Icons.calendar_today_rounded,
                                ),
                                labelText: "اختيار اليوم",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 135, 205, 206),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                labelStyle: const TextStyle(color: Colors.black),
                              ),
                              onTap: () async {
                                DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                  builder: (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Color.fromARGB(255, 135, 205, 206),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickeddate != null) {
                                  setState(() {
                                    dateController.text = pickeddate.toString().split(" ")[0];
                                  });
                                } else {
                                  print("لم يتم الاختيار");
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "ادخل اسم العلاج",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: const BorderSide(color: Color.fromARGB(255, 135, 205, 206)), // تغيير لون الحدود الخارجية هنا
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: const Color(0xff87cdce),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 7,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "اضافه",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
