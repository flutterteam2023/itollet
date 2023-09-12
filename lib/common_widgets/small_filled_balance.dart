import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmaillFilledBalance extends StatelessWidget {
  const SmaillFilledBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(114.r),
          gradient: const LinearGradient(
              colors: [Color(0xffFF533C), Color(0xffFF884B)])),
      child: Padding(
        padding:
            EdgeInsets.only(left: 16.w, right: 17.w, top: 5.h, bottom: 5.h),
        child: Text(
          'BAKİYENİZ: 214.60₺',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
