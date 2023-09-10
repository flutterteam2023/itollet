import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/constants/constant_colors.dart';

class MyAdsCard extends StatelessWidget {
  const MyAdsCard({
    super.key, required this.description, required this.time, required this.price,
  });
  final String description;
  final String time;
  final String price;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 11.w,bottom: 11.h),
      child: Container(
        decoration: BoxDecoration(
            color: greyCard, borderRadius: BorderRadius.circular(18.r)),
        child: Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 19.w, top: 12.h, bottom: 13.h),
                  child: Container(
                    height: 67.r,
                    width: 66.r,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/phone.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                  child: SizedBox(
                    width: 290.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          description,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: black),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: red),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            price,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: red),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
