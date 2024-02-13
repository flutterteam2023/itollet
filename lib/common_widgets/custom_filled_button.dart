import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/constants/constant_colors.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key, required this.text, required this.onTap, required this.radius, required this.padding,
  });
  final String text;
  final void Function() onTap;
  final double radius;
  final EdgeInsetsGeometry padding;


  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Bounceable(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: secondary,
            borderRadius: BorderRadius.circular(radius)),
        child: Padding(
          padding: padding,
          child: Center(
            child: AutoSizeText(
              textScaleFactor:textScaleFactor,
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
             
            )
          ),
        ),
      ),
    );
  }
}