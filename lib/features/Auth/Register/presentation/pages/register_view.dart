import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/common_widgets/customer_text_field.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/Register/presentation/providers/register_notifier.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class RegisterView extends HookConsumerWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerEmailController = useTextEditingController(text: '');
    final customerPasswordController = useTextEditingController(text: '');
    final customerRePasswordController = useTextEditingController(text: '');
    final customerUserNameController = useTextEditingController(text: '');

    final state = ref.watch(registerProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: secondary),
        title: Text(
          AppString.appName,
          style: TextStyle(color: secondary, fontSize: 32.sp, fontFamily: 'LeagueGothic-Regular'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 53.3.h, left: 18.w, right: 18.w, bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.register,
                style: TextStyle(color: secondary, fontSize: 24.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 18.w,
              ),
              Text(
                AppString.registerText,
                style: TextStyle(color: secondary, fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),
             
              SizedBox(height: 18.w),
              CustomerTextfield(
                passwordOnPressed: () {
                  ref.read(registerProvider.notifier).visibleConrol();
                },
                rePasswordOnPressed: () {
                  ref.read(registerProvider.notifier).rePasswordvisibleConrol();
                },
                rePasswordIsVisible: state.rePasswordVisible,
                isVisible: state.isVisible,
                emailController: customerEmailController,
                passwordController: customerPasswordController,
                rePasswordController: customerRePasswordController,
                userNameController:customerUserNameController ,
              ),
              SizedBox(height: 18.w),
              CustomFilledButton(
                padding: EdgeInsets.only(top: 20.03.h, bottom: 18.91.h),
                radius: 16.r,
                text: AppString.registerButtonText,
                onTap: () {
                  ref.read(registerProvider.notifier).customerSignUp(
                        context,
                        customerEmailController.text.trim(),
                        customerPasswordController.text,
                        customerRePasswordController.text,
                        customerUserNameController.text
                      );
                },
              ),
              SizedBox(height: 18.w),
              Padding(
                padding: EdgeInsets.only(right: 50.w, left: 50.w),
                child: Text(
                  AppString.conditions,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: secondary, fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 18.w),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: '${AppString.alreadyAccount} ',
                    style: TextStyle(fontSize: 14.sp, color: secondary, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushRoute(const LoginRoute());
                          },
                        text: AppString.alreadyAccount2,
                        style: TextStyle(
                            color: secondary, // Kelimenin rengini burada belirleyebilirsiniz
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

