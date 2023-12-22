import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/constants/constant_colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.obscureText,
    this.suffixIcon,
    required this.controller,
  });
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: secondary, fontSize: 12.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 8.69.h,
        ),
        SizedBox(
          height: 64.531.h,
          child: TextField(
            cursorColor: secondary,
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(
                color: secondary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0),
            decoration: InputDecoration(
                hintText: Text(label).data,
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide.none,
                )),
          ),
        )
      ],
    );
  }
}
