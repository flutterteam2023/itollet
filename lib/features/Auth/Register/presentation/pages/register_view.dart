import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/auth_text_field.dart';
import 'package:itollet/common_widgets/convert_account_container.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';

@RoutePage()
class RegisterView extends HookConsumerWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
          padding: EdgeInsets.only(top: 83.3.h, left: 18.w, right: 18.w,bottom: 50.h),
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
              const ConvertAccountContainer(),
              SizedBox(height: 18.w),
              //  CustomerTextfield(),
              const CustomSalesPersonTextField(),
              
      
      
      
      
      
      
      
      
              SizedBox(height: 18.w),
              CustomFilledButton(
                text: 'Hesap Oluştur',
                onTap: () {},
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
                            print("tıklandı");
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthTextField(label: AppString.companyName, obscureText: false),
    SizedBox(height: 18.w),
    const AuthTextField(label: AppString.companyPhoneNum, obscureText: false),
    SizedBox(height: 18.w),
    const AuthTextField(label: AppString.email, obscureText: false),
    SizedBox(height: 18.w),
    const AuthTextField(label: AppString.password, obscureText: true),
    SizedBox(height: 18.w),
    const AuthTextField(label: AppString.rePassword, obscureText: true),
      ],
    );
  }
}

class CustomerTextfield extends StatelessWidget {
  const CustomerTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthTextField(label: 'Email', obscureText: false),
        SizedBox(height: 18.w),
        AuthTextField(
          label: 'Şifre',
          obscureText: true,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.visibility_outlined,
                color: secondary,
              )),
        ),
        SizedBox(height: 18.w),
        AuthTextField(
          label: 'Şifre Tekrar',
          obscureText: true,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.visibility_outlined,
                color: secondary,
              )),
        ),
      ],
    );
  }
}
