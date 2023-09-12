import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/constants/constant_colors.dart';

class OfferBalance extends StatelessWidget {
  const OfferBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(114.r),
          color: secondary),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16.w,
            right: 17.w,
            top: 5.h,
            bottom: 5.h),
        child: Text(
          'TEKLİF ÜCRETİ: 3.75₺',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}