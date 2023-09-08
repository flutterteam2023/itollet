import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itollet/constants/constant_colors.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.title,
    required this.ellipsePath,
    required this.iconPath,
    required this.onTap,
  });
  final String title;
  final String ellipsePath;
  final String iconPath;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bounceable(
          onTap: onTap,
          child: Stack(
            children: [
              SvgPicture.asset(
                ellipsePath,
                width: 64.r,
                height: 64.r,
                fit: BoxFit.scaleDown,
              ),
              Positioned(
                  top: 17.h,
                  bottom: 16.32.h,
                  left: 13.w,
                  right: 13.w,
                  child: SvgPicture.asset(
                    iconPath,
                    width: 32.w,
                    height: 30.676.h,
                  ))
            ],
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: black),
        )
      ],
    );
  }
}
