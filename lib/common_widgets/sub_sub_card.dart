import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';

class SubSubCard extends StatelessWidget {
  const SubSubCard({
    super.key, required this.title, required this.price, required this.time, required this.imageUrl, required this.categoryModel,
  });
  final String title;
  final String price;
  final DateTime time;
  final String imageUrl;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r), color: greyCard),
      child: Padding(
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 11.h, bottom: 15.h),
        child: Column(
          children: [
            Container(
              height: 128.r,
              width: 128.r,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:  DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill),
                  border: Border.all(width: 3, color: categoryModel.primaryColor)),
                  
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: TextStyle(
                  color: black, fontSize: 16.sp, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "$price ₺",
              style: TextStyle(
                  color: categoryModel.primaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins Italic'),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Kalan Süre: ${time.hour}:${time.minute}',
              style: TextStyle(
                color: categoryModel.primaryColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
