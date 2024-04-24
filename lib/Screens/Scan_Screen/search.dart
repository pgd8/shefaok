import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';

class Search extends StatefulWidget {
  static const String routeName = "Search Screen";

  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.08.sh,
            backgroundColor: MyTheme.primaryColor,
            leading: CircleAvatar(
              radius: 25.r,
              backgroundImage: AssetImage("assets/images/doctor.jpg"),
            ),
            title: Text(
              "اسم المريض",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                children: [
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    " تبحث عن دواءٍ معين !",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ]),
          ),
        ));
  }
}
