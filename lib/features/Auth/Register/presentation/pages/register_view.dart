import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/auth_text_field.dart';
import 'package:itollet/common_widgets/convert_account_container.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/Register/presentation/providers/register_notifier.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class RegisterView extends HookConsumerWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companyNameController = useTextEditingController(text: '');
    final companyPhoneController = useTextEditingController(text: '');
    final salesEmailController = useTextEditingController(text: '');
    final salesPasswordController = useTextEditingController(text: '');
    final salesRePasswordController = useTextEditingController(text: '');
    final customerEmailController = useTextEditingController(text: '');
    final customerPasswordController = useTextEditingController(text: '');
    final customerRePasswordController = useTextEditingController(text: '');
    final state = ref.watch(registerProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: secondary),
        title: Text(
          AppString.appName,
          style: TextStyle(
              color: secondary,
              fontSize: 32.sp,
              fontFamily: 'LeagueGothic-Regular'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 83.3.h, left: 18.w, right: 18.w, bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.register,
                style: TextStyle(
                    color: secondary,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 18.w,
              ),
              Text(
                AppString.registerText,
                style: TextStyle(
                    color: secondary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 18.w,
              ),
              ConvertAccountContainer(
                iscustomer: state.iscustomer,
                customerOnTap: () {
                  ref.read(registerProvider.notifier).isCustomerControl();
                },
                salesOnTap: () {
                  ref.read(registerProvider.notifier).isSalesControl();
                },
              ),
              SizedBox(height: 18.w),
              state.iscustomer == true
                  ? CustomerTextfield(
                      passwordOnPressed: () {
                        ref.read(registerProvider.notifier).visibleConrol();
                      },
                      rePasswordOnPressed: () {
                        ref
                            .read(registerProvider.notifier)
                            .rePasswordvisibleConrol();
                      },
                      rePasswordIsVisible: state.rePasswordVisible,
                      isVisible: state.isVisible,
                      emailController: customerEmailController,
                      passwordController: customerPasswordController,
                      rePasswordController: customerRePasswordController,
                    )
                  : CustomSalesPersonTextField(
                      passwordIsVisible: state.salesIsVisible,
                      rePasswordIsVisible: state.salesRePasswordVisible,
                      passwordOnPressed: () {
                        ref
                            .read(registerProvider.notifier)
                            .salesVisibleConrol();
                      },
                      repasswordOnPressed: () {
                        ref
                            .read(registerProvider.notifier)
                            .salesRePasswordvisibleConrol();
                      },
                      companyNameController: companyNameController,
                      companyPhoneController: companyPhoneController,
                      emailController: salesEmailController,
                      passswordController: salesPasswordController,
                      repasswordController: salesRePasswordController,
                    ),
              SizedBox(height: 18.w),
              CustomFilledButton(
                text: AppString.registerButtonText,
                onTap: () {
                 state.iscustomer ==true? ref.read(registerProvider.notifier).customerSignUp(
                      context,
                      customerEmailController.text,
                      customerPasswordController.text,
                      customerRePasswordController.text):
                      ref.read(registerProvider.notifier).salesSignUp(context, companyNameController.text, companyPhoneController.text, salesEmailController.text, salesPasswordController.text, salesRePasswordController.text);
                },
              ),
              SizedBox(height: 18.w),
              Padding(
                padding: EdgeInsets.only(right: 50.w, left: 50.w),
                child: Text(
                  AppString.conditions,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: secondary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 18.w),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: '${AppString.alreadyAccount} ',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: secondary,
                        fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushRoute(const LoginRoute());
                          },
                        text: AppString.alreadyAccount2,
                        style: TextStyle(
                            color:
                                secondary, // Kelimenin rengini burada belirleyebilirsiniz
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

class CustomSalesPersonTextField extends StatelessWidget {
  const CustomSalesPersonTextField({
    super.key,
    required this.companyNameController,
    required this.companyPhoneController,
    required this.emailController,
    required this.passswordController,
    required this.repasswordController,
    required this.passwordOnPressed,
    required this.repasswordOnPressed,
    required this.passwordIsVisible,
    required this.rePasswordIsVisible,
  });
  final TextEditingController companyNameController;
  final TextEditingController companyPhoneController;
  final TextEditingController emailController;
  final TextEditingController passswordController;
  final TextEditingController repasswordController;
  final void Function() passwordOnPressed;
  final void Function() repasswordOnPressed;
  final bool passwordIsVisible;
  final bool rePasswordIsVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
            controller: companyNameController,
            label: AppString.companyName,
            obscureText: false),
        SizedBox(height: 18.w),
        AuthTextField(
            controller: companyPhoneController,
            label: AppString.companyPhoneNum,
            obscureText: false),
        SizedBox(height: 18.w),
        AuthTextField(
            controller: emailController,
            label: AppString.email,
            obscureText: false),
        SizedBox(height: 18.w),
        AuthTextField(
            suffixIcon: IconButton(
                onPressed: passwordOnPressed,
                icon: Icon(
                  passwordIsVisible == true
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: secondary,
                )),
            controller: passswordController,
            label: AppString.password,
            obscureText: passwordIsVisible),
        SizedBox(height: 18.w),
        AuthTextField(
            suffixIcon: IconButton(
                onPressed: repasswordOnPressed,
                icon: Icon(
                  rePasswordIsVisible == true
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: secondary,
                )),
            controller: repasswordController,
            label: AppString.rePassword,
            obscureText: rePasswordIsVisible),
      ],
    );
  }
}

class CustomerTextfield extends StatelessWidget {
  const CustomerTextfield({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
    required this.isVisible,
    required this.passwordOnPressed,
    required this.rePasswordOnPressed,
    required this.rePasswordIsVisible,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final bool isVisible;
  final bool rePasswordIsVisible;
  final void Function() passwordOnPressed;
  final void Function() rePasswordOnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
            controller: emailController, label: 'Email', obscureText: false),
        SizedBox(height: 18.w),
        AuthTextField(
          controller: passwordController,
          label: 'Şifre',
          obscureText: isVisible,
          suffixIcon: IconButton(
              onPressed: passwordOnPressed,
              icon: Icon(
                isVisible == false
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: secondary,
              )),
        ),
        SizedBox(height: 18.w),
        AuthTextField(
          controller: rePasswordController,
          label: 'Şifre Tekrar',
          obscureText: rePasswordIsVisible,
          suffixIcon: IconButton(
              onPressed: rePasswordOnPressed,
              icon: Icon(
                rePasswordIsVisible == false
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: secondary,
              )),
        ),
      ],
    );
  }
}
