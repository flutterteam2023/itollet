import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/constants/app_image.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';
@RoutePage()
class VerificationView extends HookConsumerWidget {
  const VerificationView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.verification,width:128.r ,height: 128.r,),
            SizedBox(height:18.h ,),
            Text(AppString.accountVerification,
            style: TextStyle(
              color: secondary,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600
            ),
            ),
            SizedBox(height:18.h ,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(AppString.verificationText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondary,
                fontSize:12.sp,
                fontWeight: FontWeight.w400 
              ),
              ),
            ),
            SizedBox(height:18.h ,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.w),
              child: CustomFilledButton(text: AppString.eMailAppOpen, onTap: (){}),
            ),




        
          ],
        ),
      ),

    );
  }
}