import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/link_card.dart';
import 'package:itollet/common_widgets/my_ads_card.dart';
import 'package:itollet/common_widgets/post_detail_button.dart';
import 'package:itollet/constants/app_image.dart';
import 'package:itollet/constants/constant_colors.dart';

@RoutePage()
class MyAdsView extends ConsumerWidget {
  const MyAdsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          AppImage.logo,
          width: 136.w,
          height: 49.h,
        ),
        leading: Builder(
          builder: (context) {
            return Bounceable(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: SvgPicture.asset(
                AppImage.menuIcon,
                width: 48.r,
                height: 48.r,
                fit: BoxFit.scaleDown,
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Bounceable(
              onTap: () {},
              child: Container(
                height: 55.r,
                width: 55.r,
                decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.circular(30.r)),
                child: const Center(
                    child: Icon(
                  Icons.person_outlined,
                  color: Colors.white,
                )),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 24.h),
        child: Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffFF884B), Color(0xffFF533C)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: AppBar(
                    forceMaterialTransparency: true,
                    surfaceTintColor: Colors.white,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.white,
                    iconTheme: const IconThemeData(color: Colors.white),
                    centerTitle: true,
                    title: Text(
                      'İLANLARIM',
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
            SizedBox(
              height: 14.h,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.4,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return  const MyAdsCard(
                    description: 'Uygun fiyatlı huawei telefon arıyorum bütçem en çok fazla yok...',
                    time: 'SON 22 DAKİKA',
                    price: '23.000₺',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

