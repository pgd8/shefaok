import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';

class WritingScreen extends StatefulWidget {
  static const String routeName = "Writing Screen";

  const WritingScreen({super.key});

  @override
  State<WritingScreen> createState() => WritingScreenState();
}

class WritingScreenState extends State<WritingScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.04.sh,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.r,
                    backgroundImage:
                        const AssetImage("assets/images/doctor.jpg"),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "اسم المريض",
                    style:
                        TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "اسم العلاج",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "ادخل اسم العلاج",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(
                            255, 135, 205, 206)), // تحديد لون الحدود الخارجية
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 135, 205,
                            206)), // تحديد لون الحدود الخارجية عند التركيز
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                ),
              ),
              const Spacer(),
              TextButton(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 0.06.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: MyTheme.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      "البحث",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                onPressed: () {
                  //successDialog();
                  failedDialog();
                },
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              TextButton(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 0.07.sh,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                      border: const Border.fromBorderSide(
                          BorderSide(color: MyTheme.primaryColor, width: 2.0))),
                  child: Center(
                    child: Text(
                      "الرجوع",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: MyTheme.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future successDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            // Make dialog background transparent
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.1), // Slightly visible background
                  ),
                ),
                AlertDialog(
                  surfaceTintColor: Colors.white,
                  insetPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.38,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(
                        top: 20.h, bottom: 18.h, left: 8.w, right: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/done.png",
                          height: 100.r,
                          width: 100.r,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "!تهنئة",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "العلاج مناسب",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15.sp),
                        ),
                        const Spacer(),
                        TextButton(
                          child: Container(
                            height: 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: const Color(0xff87cdce),
                            ),
                            child: Center(
                              child: Text(
                                "الرجوع",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Future failedDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            // Make dialog background transparent
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.1), // Slightly visible background
                  ),
                ),
                AlertDialog(
                  surfaceTintColor: Colors.white,
                  insetPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.38,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(
                        top: 20.h, bottom: 18.h, left: 8.w, right: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/failed.png",
                          height: 100.r,
                          width: 100.r,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "! للأسف",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "العلاج غير مناسب",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15.sp),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextButton(
                                child: Container(
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: const Color(0xff87cdce),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "الرجوع",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                child: Container(
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: const Color(0xff87cdce),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "الشات بوت",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ChatBotWelcomeTap()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
