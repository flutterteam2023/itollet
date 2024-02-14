import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:itollet/features/Ads/presentation/pages/ads_view.dart';
import 'package:itollet/features/Auth/ForgotPassword/presentation/pages/forgot_password_view.dart';
import 'package:itollet/features/Auth/Login/presentation/pages/login_view.dart';
import 'package:itollet/features/Auth/Register/presentation/pages/register_view.dart';
import 'package:itollet/features/Auth/Verification/presentation/pages/verification_view.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';
import 'package:itollet/features/Categories/models/subcategory/subcategory_model.dart';
import 'package:itollet/features/Help/post_proccess_view.dart';
import 'package:itollet/features/Help/presentation/pages/account_delete_view.dart';
import 'package:itollet/features/Help/presentation/pages/help_view.dart';
import 'package:itollet/features/Help/presentation/pages/login_password_info.dart';
import 'package:itollet/features/Help/presentation/pages/payment_refund_view.dart';
import 'package:itollet/features/Home/presentation/pages/home_view.dart';
import 'package:itollet/features/MyAds/presentation/pages/my_ads_view.dart';
import 'package:itollet/features/Payment/Views/payment_view.dart';
import 'package:itollet/features/Payment/Views/webview_view.dart';
import 'package:itollet/features/PostAdd/postadd_view.dart';
import 'package:itollet/features/PostDetail/presentation/pages/post_detail_view.dart';
import 'package:itollet/features/Privacy/presentation/pages/privacy_policy_view.dart';
import 'package:itollet/features/Privacy/presentation/pages/privacy_view.dart';
import 'package:itollet/features/Profile/presentation/pages/profile_view.dart';
import 'package:itollet/features/ProfileEdit/presentation/password_change_view.dart';
import 'package:itollet/features/ProfileEdit/presentation/profile_edit_view.dart';
import 'package:itollet/features/ProfileEdit/presentation/profile_photo_change_view.dart';
import 'package:itollet/features/ProfileEdit/presentation/user_name_change_view.dart';
import 'package:itollet/features/Splash/presentation/pages/easy_splash.dart';
import 'package:itollet/features/Splash/presentation/pages/splash_view.dart';
import 'package:itollet/features/SubCategory/presentation/pages/sub_category_view.dart';
import 'package:itollet/features/SubSubCategory/presentation/pages/sub_sub_category_view.dart';
import 'package:itollet/features/Wallet/presentation/pages/balance_activities_view.dart';
import 'package:itollet/features/Wallet/presentation/pages/balance_view.dart';
import 'package:itollet/features/Wallet/presentation/pages/iframe_screen_view.dart';
import 'package:itollet/features/Wallet/presentation/pages/wallet_view.dart';

import '../features/Wallet/presentation/pages/add_balance_view.dart';

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
        AutoRoute(page: SubCategoryRoute.page, initial: false),
        AutoRoute(page: PostDetailRoute.page, initial: false),
        //Wallet Screens
        AutoRoute(
          page: WalletRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: AddBalanceRoute.page,
          initial: false,
          fullscreenDialog: true,
        ),
        AutoRoute(
          page: BalanceRoute.page,
          initial: false,
          fullscreenDialog: true,
        ),
        AutoRoute(
          page: BalanceActivitiesRoute.page,
          initial: false,
          fullscreenDialog: true,
        ),


        AutoRoute(
          page: IFrameScreenRoute.page,
          initial: false,
          fullscreenDialog: true,
        ),
        //!SECTION

        AutoRoute(page: ProfileRoute.page, initial: false),
        AutoRoute(page: MyAdsRoute.page, initial: false),
        AutoRoute(page: SubSubCategoryRoute.page, initial: false),
        AutoRoute(page: AdsRoute.page, initial: false),
        AutoRoute(page: PrivacyRoute.page, initial: false),
        AutoRoute(
          page: PrivacyPolicyRoute.page,
          initial: false,
          fullscreenDialog: true,
        ),
        AutoRoute(
          page: HelpRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: PostProccessRoute.page,
          initial: false,
          fullscreenDialog: true,
        ),
        AutoRoute(page: ProfileEditRoute.page, initial: false),
        AutoRoute(page: PostAddRoute.page, initial: false),
        AutoRoute(page: ProfilePhotoChangeRoute.page, initial: false),
        AutoRoute(page: UserNameChangeRoute.page, initial: false),
        AutoRoute(page: PasswordChangeRoute.page, initial: false),
        AutoRoute(page: PaymentRoute.page, initial: false),
        AutoRoute(page: WebRoute.page, initial: false),
        AutoRoute(page: LoginPasswordInfoRoute.page, initial: false),
        AutoRoute(page: PaymentRefundRoute.page, initial: false),
        AutoRoute(page: AccountDeleteRoute.page, initial: false),
      ];
}
