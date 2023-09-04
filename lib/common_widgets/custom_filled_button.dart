import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/constants/constant_colors.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final void Function() onTap;


  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: secondary,
            borderRadius: BorderRadius.circular(16.r)),
        child: Padding(
          padding: EdgeInsets.only(top: 20.03.h, bottom: 18.91.h),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}