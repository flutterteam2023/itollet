import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/auth_text_field.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';

@RoutePage()
class ForgotPasswordView extends HookConsumerWidget {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: '');
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: secondary),
        title: Text(
          AppString.appName,
          style: TextStyle(
              color: secondary,
              fontSize: 32.sp,
              fontFamily: 'LeagueGothic-Regular'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 250.12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.forgotPassword2,
                style: TextStyle(
                  color: secondary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                AppString.forgotPasswordText,
                style: TextStyle(
                  color: secondary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
               AuthTextField(
                controller: emailController,
                label: AppString.email, obscureText: false),
              SizedBox(
                height: 18.h,
              ),
              CustomFilledButton(text:AppString.resetPassword, onTap:() {
                
              },)
            ],
          ),
        ),
      ),
    );
  }
}
