import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itollet/common_widgets/auth_text_field.dart';
import 'package:itollet/constants/constant_colors.dart';

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
        AuthTextField(controller: emailController, label: 'Email', obscureText: false),
        SizedBox(height: 18.w),
        AuthTextField(
          controller: passwordController,
          label: 'Şifre',
          obscureText: isVisible,
          suffixIcon: IconButton(
              onPressed: passwordOnPressed,
              icon: Icon(
                isVisible == false ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
                rePasswordIsVisible == false ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                color: secondary,
              )),
        ),
      ],
    );
  }
}
