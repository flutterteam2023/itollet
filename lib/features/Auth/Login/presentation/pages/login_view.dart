import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/auth_text_field.dart';
import 'package:itollet/common_widgets/convert_account_container.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/Login/presentation/providers/login_notifier.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class LoginView extends HookConsumerWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: '');
    final passswordController = useTextEditingController(text: '');
    final state  = ref.watch(loginProvider);

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
             ConvertAccountContainer(
              customerOnTap: () {
                ref.read(loginProvider.notifier).isCustomerControl();
                
              },
              iscustomer: state.iscustomer,
              salesOnTap: () {
                ref.read(loginProvider.notifier).isSalesControl();
                
              },
            ),
            SizedBox(
              height: 18.23.h,
            ),
             AuthTextField(
              controller: emailController,
              obscureText: false,
              label: AppString.email,
            ),
            SizedBox(
              height: 18.h,
            ),
            AuthTextField(
              controller: passswordController,
              suffixIcon: IconButton(
                  onPressed: () {
                    ref.read(loginProvider.notifier).visibleControl();
                  },
                  icon:  Icon(
                   state.isVisible==false? Icons.visibility_outlined:Icons.visibility_off_outlined,
                    color: secondary,
                  )),
              obscureText:state.isVisible,
              label: AppString.password,
            ),
            SizedBox(
              height: 18.h,
            ),
            Bounceable(
              onTap: () {
                context.pushRoute(const ForgotPasswordRoute());
              },
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
              onTap: ()async {
                ref.read(loginProvider.notifier).login(context,emailController.text,passswordController.text);
                
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
                        context.pushRoute(const RegisterRoute());
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

