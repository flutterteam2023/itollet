import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetailButton extends StatelessWidget {
  const PostDetailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:18.w,right: 9.w ),
      child: Bounceable(
        onTap: () {
          
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            color: const Color(0xffFF553D),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical:13.h ),
            child: Center(
              child: Text("TEKLİF VER (3.75₺)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight:FontWeight.w400
              ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
