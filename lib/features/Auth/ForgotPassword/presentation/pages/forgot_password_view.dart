import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/auth_text_field.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/ForgotPassword/presentation/providers/forgot_notifier.dart';

@RoutePage()
class ForgotPasswordView extends HookConsumerWidget {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final emailController = useTextEditingController(text: '');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: secondary),
        centerTitle: true,
        title: AutoSizeText(
          textScaleFactor:textScaleFactor,
          AppString.appName,
          style: TextStyle(
              color: secondary,
              fontSize: 32.sp,
              fontFamily: 'LeagueGothic-Regular'),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 250.12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  textScaleFactor:textScaleFactor,
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
                AutoSizeText(
                  textScaleFactor:textScaleFactor,
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
                CustomFilledButton(
                  padding: EdgeInsets.only(top: 20.03.h, bottom: 18.91.h),
                  radius: 16.r,
                  text:AppString.resetPassword, onTap:() {
                  ref.read(forgotProvider.notifier).resetPassword(context, emailController.text);
                  
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
