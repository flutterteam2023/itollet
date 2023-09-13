import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/constants/constant_colors.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 11.w, bottom: 7.h),
      child: Bounceable(
        onTap: () {
          
        },
        child: Container(
          decoration: BoxDecoration(
              color: greyCard,
              borderRadius: BorderRadius.circular(18.r)),
          child: Padding(
            padding: EdgeInsets.only(
                left: 17.w, right: 17.5.w, top: 15.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 12.r,
                      width: 12.r,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: secondary),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text(
                      "https://www.letgo.com/item/ps-4-pro-2-tb-hafiz...",
                      style: TextStyle(
                          color:  secondary,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: secondary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

