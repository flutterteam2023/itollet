import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';

class LinkCard extends StatelessWidget {
  const LinkCard({
    super.key, required this.categoryModel, required this.onTap, required this.url,
  });
  final CategoryModel? categoryModel;
  final void Function() onTap;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 11.w, bottom: 7.h),
      child: Bounceable(
        onTap: onTap,
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
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color:categoryModel!=null? categoryModel!.primaryColor:secondary),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    SizedBox(
                      width: 250.w,
                      child: Text(
                       url,
                        style: TextStyle(
                            color: categoryModel!=null? categoryModel!.primaryColor:secondary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                 Icon(
                  Icons.arrow_forward_ios,
                  color:categoryModel!=null? categoryModel!.primaryColor:secondary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

