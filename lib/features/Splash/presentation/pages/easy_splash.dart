import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Splash/presentation/pages/splash_view.dart';
import 'package:itollet/routing/app_router.dart';
@RoutePage()
class EasySplashView extends ConsumerWidget {
  const EasySplashView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: Colors.white,
        onEnd: () {
          context.replaceRoute(const SplashRoute());
        },
        childWidget: Padding(
        padding:  EdgeInsets.only(left: 15.w,right: 15.w),
        child: Center(child: Image.asset('assets/images/appLogo.png')),
      ),
      onAnimationEnd: () {
        debugPrint('On Fade In End');
      },
      defaultNextScreen: const SplashView(),
      )
      
    );
  }
}