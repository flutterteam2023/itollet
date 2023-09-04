import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';

class ConvertAccountContainer extends StatelessWidget {
  const ConvertAccountContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: primary),
      child: Padding(
        padding: EdgeInsets.only(
            left: 7.23.w, right: 78.32.w, top: 6.68.h, bottom: 6.68.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Bounceable(
            //   onTap: () {},
            //   child: Text(
            //     AppString.customer,
            //     style: TextStyle(
            //       color: secondary,
            //       fontSize: 12.sp,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 16.69.h,
                    bottom: 16.69.h,
                    left: 71.09.w,
                    right: 70.09.w),
                child: Text(
                  AppString.customer,
                  style: TextStyle(
                      color: secondary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Bounceable(
              onTap: () {},
              child: Text(
                AppString.salesPerson,
                style: TextStyle(
                  color: secondary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



