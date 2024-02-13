import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';

class ConvertAccountContainer extends StatelessWidget {
  const ConvertAccountContainer({
    super.key, required this.salesOnTap, required this.iscustomer, required this.customerOnTap,
  });
  final void Function() salesOnTap;
  final void Function() customerOnTap;

final bool iscustomer;
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: primary),
      child: Padding(
        padding: EdgeInsets.only(
            left:iscustomer==true? 7.23.w:78.32.w, right:iscustomer==true? 78.32.w:7.23.w, top: 6.68.h, bottom: 6.68.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
           iscustomer==true? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 16.69.h,
                    bottom: 16.69.h,
                    left: 71.09.w,
                    right: 70.09.w),
                child: AutoSizeText(
                  textScaleFactor: textScaleFactor,
                  AppString.customer,
                  style: TextStyle(
                      color: secondary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ):Bounceable(
              onTap: customerOnTap,
              child: AutoSizeText(
                textScaleFactor: textScaleFactor,
                AppString.customer,
                style: TextStyle(
                  color: secondary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            iscustomer==false?Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 16.69.h,
                    bottom: 16.69.h,
                    left: 71.09.w,
                    right: 70.09.w),
                child: AutoSizeText(
                  textScaleFactor: textScaleFactor,
                  AppString.salesPerson,
                  style: TextStyle(
                      color: secondary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ):
            Bounceable(
              onTap: salesOnTap,
              child: AutoSizeText(
                textScaleFactor: textScaleFactor,
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



