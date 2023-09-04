import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/auth_text_field.dart';
import 'package:itollet/common_widgets/convert_account_container.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';

@RoutePage()
class LoginView extends HookConsumerWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 200.h, left: 18.w, right: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.welcome,
              style: TextStyle(
                  color: secondary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              AppString.loginText,
              style: TextStyle(
                  color: secondary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 18.h,
            ),
            const ConvertAccountContainer(),
            SizedBox(
              height: 18.23.h,
            ),
            const AuthTextField(
              obscureText: false,
              label: AppString.email,
            ),
            SizedBox(
              height: 18.h,
            ),
            AuthTextField(
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_outlined,
                    color: secondary,
                  )),
              obscureText: true,
              label: AppString.password,
            ),
            SizedBox(
              height: 18.h,
            ),
            Bounceable(
              onTap: () {},
              child: Text(
                AppString.forgotPassword,
                style: TextStyle(
                    color: secondary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            CustomFilledButton(
              onTap: () {
                
              },
              text: AppString.login,
            ),
            SizedBox(
              height: 18.h,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: '${AppString.notAccount} ',
                  style: TextStyle(
                    fontSize: 14.sp, 
                    color: secondary,
                    fontWeight: FontWeight.w400
                    ),
                  children:  [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap =() {
                        print("tıklandı");
                      },
                      text: AppString.registerAccount,
                      style: TextStyle(
                          color:
                              secondary, // Kelimenin rengini burada belirleyebilirsiniz
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600
            
                          
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

