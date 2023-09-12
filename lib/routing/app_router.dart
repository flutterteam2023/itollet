import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:itollet/features/Ads/presentation/pages/ads_view.dart';
import 'package:itollet/features/Auth/ForgotPassword/presentation/pages/forgot_password_view.dart';
import 'package:itollet/features/Auth/Login/presentation/pages/login_view.dart';
import 'package:itollet/features/Auth/Register/presentation/pages/register_view.dart';
import 'package:itollet/features/Auth/Verification/presentation/pages/verification_view.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';
import 'package:itollet/features/Home/presentation/pages/home_view.dart';
import 'package:itollet/features/MyAds/presentation/pages/my_ads_view.dart';
import 'package:itollet/features/PostDetail/presentation/pages/post_detail_view.dart';
import 'package:itollet/features/Profile/presentation/pages/profile_view.dart';
import 'package:itollet/features/Splash/presentation/pages/easy_splash.dart';
import 'package:itollet/features/Splash/presentation/pages/splash_view.dart';
import 'package:itollet/features/SubCategory/presentation/pages/sub_category_view.dart';
import 'package:itollet/features/SubSubCategory/presentation/pages/sub_sub_category_view.dart';

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
        AutoRoute(page: EasySplashRoute.page, initial: false),
        AutoRoute(page: SubCategoryRoute.page, initial: false),
        AutoRoute(page: PostDetailRoute.page, initial: false),

        AutoRoute(page: ProfileRoute.page,initial: false),
        AutoRoute(page: MyAdsRoute.page,initial: false),
        AutoRoute(page: SubSubCategoryRoute.page,initial: false),
        AutoRoute(page: AdsRoute.page,initial: true),

        





      ];
}
