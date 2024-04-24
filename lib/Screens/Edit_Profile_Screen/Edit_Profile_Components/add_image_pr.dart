import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddImagePr extends StatelessWidget {
  const AddImagePr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
          onPressed: () {},
          icon: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: Icon(
                Icons.add_a_photo,
                size: 40.sp,
              ))),
      SizedBox(
        height: 0.01.sh,
      ),
      const Text('اضافه صورة'),
      SizedBox(
        height: 0.01.sh,
      ),
      const Text(
        'ستكون هذه صورتك في التطبيق',
        style: TextStyle(color: Colors.grey),
      ),
    ]);
  }
}
