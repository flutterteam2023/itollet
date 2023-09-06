import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/constants/app_image.dart';
import 'package:itollet/constants/app_strings.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/Register/presentation/providers/register_notifier.dart';
import 'package:itollet/features/Auth/Verification/presentation/providers/verification_notifier.dart';
import 'package:itollet/routing/app_router.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
@RoutePage()


class VerificationView extends StatefulHookConsumerWidget {
  const VerificationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerificationViewState();
}
class _VerificationViewState extends ConsumerState<VerificationView> {
  final auth = FirebaseAuth.instance;
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
        ref.watch(registerProvider.notifier).emailVerificationControl(isEmailVerified);
  

      
    });

    if (isEmailVerified) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("E mail doğrulama başarılı",style:TextStyle(color: Colors.white),),backgroundColor: secondary,));
          // ignore: use_build_context_synchronously
          context.replaceRoute(const LoginRoute());

      timer?.cancel();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: CustomFilledButton(text: AppString.eMailAppOpen, onTap: (){
                ref.read(verificationProvider.notifier).launchEmailApp();
              }),
            ),
            SizedBox(height:18.h ,),

            Bounceable(
              onTap: () {
                context.pushRoute(const LoginRoute());
              },
              child: const Text("Giriş Sayfasına Geri Dön",
              style: TextStyle(
                color: secondary,
                fontWeight: FontWeight.bold
              ),
              ),
            )




        
          ],
        ),
      ),

    );
  }
}