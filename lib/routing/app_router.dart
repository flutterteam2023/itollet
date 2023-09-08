import 'package:auto_route/auto_route.dart';
import 'package:itollet/features/Auth/ForgotPassword/presentation/pages/forgot_password_view.dart';
import 'package:itollet/features/Auth/Login/presentation/pages/login_view.dart';
import 'package:itollet/features/Auth/Register/presentation/pages/register_view.dart';
import 'package:itollet/features/Auth/Verification/presentation/pages/verification_view.dart';
import 'package:itollet/features/Home/presentation/pages/home_view.dart';
import 'package:itollet/features/Splash/presentation/pages/easy_splash.dart';
import 'package:itollet/features/Splash/presentation/pages/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: false),
        AutoRoute(page: RegisterRoute.page, initial: false),
        AutoRoute(page: VerificationRoute.page, initial: false),
        AutoRoute(page: ForgotPasswordRoute.page, initial: false),
        AutoRoute(page: HomeRoute.page, initial: false),
        AutoRoute(page: SplashRoute.page, initial: false),
        AutoRoute(page: EasySplashRoute.page, initial: true),
      ];
}
