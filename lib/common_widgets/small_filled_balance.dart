import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';

class SmaillFilledBalance extends StatelessWidget {
  final CategoryModel categoryModel;
  const SmaillFilledBalance({
    super.key, required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(114.r),
          gradient:  LinearGradient(
              colors: [categoryModel.primaryColor, categoryModel.secondaryColor])),
      child: Padding(
        padding:
            EdgeInsets.only(left: 16.w, right: 17.w, top: 5.h, bottom: 5.h),
        child: Text(
          'BAKİYENİZ: 214.60₺',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
