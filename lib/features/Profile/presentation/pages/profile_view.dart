import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/common_widgets/element_ellipse.dart';
import 'package:itollet/constants/app_image.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 31.h),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 128.h,
                    width: 127.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(homeState.user.photoUrl??'https://www.shareicon.net/data/512x512/2015/10/04/111640_personal_512x512.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 18.sp,
                  ),
                  Text(
                    homeState.user.userName!,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                  Text(
                    homeState.user.email!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: black02,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 132.w, right: 117.w, top: 15.h, bottom: 43.h),
                    child: CustomFilledButton(
                      padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                      radius: 18.r,
                      text: "PROFİLİ DÜZENLE",
                      onTap: () {},
                    ),
                  ),
                  profileCard(context, scaffoldKey),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding profileCard(
      BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.w),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          ElementEllipse(
            title: 'İLANLARIM',
            colors: const [Color(0xffFF553D), Color(0xffFF864B)],
            onTap: () {
              context.pushRoute(const MyAdsRoute());
            },
          ),
          ElementEllipse(
            title: 'CÜZDANIM',
            colors: const [Color(0xff5CC65D), Color(0xff2CA882)],
            onTap: () {
              context.pushRoute(const WalletRoute());
            },
          ),
          ElementEllipse(
            title: 'GİZLİLİK',
            colors: const [Color(0xff0046A5), Color(0xff50D7E0)],
            onTap: () {
              context.pushRoute(const PrivacyRoute());

            },
          ),
          ElementEllipse(
            title: 'YARDIM',
            colors: const [Color(0xff834AFA), Color(0xffD14C88)],
            onTap: () {
              context.pushRoute(const HelpRoute());

            },
          ),
          ElementEllipse(
            title: 'DEĞERLENDİR',
            colors: const [Color(0xffFFAEF6), Color(0xffFFE0C6)],
            onTap: () {},
          ),
          ElementEllipse(
            title: 'ÇIKIŞ YAP',
            colors: const [Color(0xffFED552), Color(0xffFF8099)],
            onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                scaffoldKey.currentState?.closeDrawer();
                Future.delayed(const Duration(milliseconds: 500), () {
                  context.popRoute();
                });
              });
            },
          )
        ],
      ),
    );
  }
}
