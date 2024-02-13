import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetailButton extends StatelessWidget {
  const PostDetailButton({
    super.key,
    required this.title,
    required this.colors,
    this.onTap,
  });
  final String title;
  final List<Color> colors;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 9.w),
      child: Bounceable(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 13.h),
            child: Center(
              child: AutoSizeText(
                textScaleFactor: textScaleFactor,
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
