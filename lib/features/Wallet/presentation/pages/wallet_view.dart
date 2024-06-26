import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/common_widgets/element_ellipse.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/constants/profile_icons.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class WalletView extends ConsumerWidget {
  const WalletView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;


    return Scaffold(
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 24.h),
        child: Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Container(
                  decoration: const BoxDecoration(color: secondary),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                        onPressed: () {
                          context.popRoute();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    forceMaterialTransparency: true,
                    surfaceTintColor: Colors.white,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.white,
                    iconTheme: const IconThemeData(color: Colors.white),
                    centerTitle: true,
                    title: AutoSizeText(
                      textScaleFactor: textScaleFactor,
                      'CÜZDANIM',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    backgroundColor:
                        Colors.white, // Arkaplan rengini transparent yapın
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 31.h),
              child: Center(
                child: Column(
                  children: [
                    walletCard(context, scaffoldKey),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding walletCard(
      BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.w),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          ElementEllipse(
            title: 'BAKİYE',
            iconUrl: WalletIcons.balance,
            colors: const [Color(0xffFF553D), Color(0xffFF864B)],
            onTap: () {
              context.pushRoute(const BalanceRoute());
            },
          ),
          ElementEllipse(
            title: 'BAKİYE\nYÜKLE',
            iconUrl: WalletIcons.addBalance,
            colors: const [Color(0xff5CC65D), Color(0xff2CA882)],
            onTap: () {
              context.pushRoute(const AddBalanceRoute());
            },
          ),
          ElementEllipse(
            title: 'HESAP HAREKETLERİ',
            iconUrl: WalletIcons.accountActivities,
            colors: const [Color(0xff0046A5), Color(0xff50D7E0)],
            onTap: () {
              context.pushRoute(const BalanceActivitiesRoute());
            },
          ),
        ],
      ),
    );
  }
}
