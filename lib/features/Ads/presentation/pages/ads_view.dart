import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/ads_edit_textfield.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/common_widgets/link_card.dart';
import 'package:itollet/common_widgets/offer_balance.dart';
import 'package:itollet/common_widgets/post_detail_button.dart';
import 'package:itollet/common_widgets/small_filled_balance.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';

@RoutePage()
class AdsView extends ConsumerWidget {
  const AdsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

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
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffFF543D), Color(0xffFF884B)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                        onPressed: () {
                          context.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    forceMaterialTransparency: true,
                    surfaceTintColor: Colors.white,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.white,
                    iconTheme: const IconThemeData(color: Colors.white),
                    centerTitle: true,
                    title: Text(
                      'İLAN SAHİBİ ADI',
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
              padding: EdgeInsets.only(left: 16.w, right: 11.w, top: 16.h),
              child: Container(
                decoration: BoxDecoration(
                  color: greyCard,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 13.w, top: 17.h, bottom: 17.h, right: 13.w),
                  child: Row(
                    children: [
                      Container(
                        height: 128.r,
                        width: 128.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/images/phone.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: SizedBox(
                          width: 214.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                "Ps 4 pro en az 2tb hafıza",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                                maxLines: 2,
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Text(
                                "Bütçe 3.000₺",
                                style: TextStyle(
                                    color: red,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Kalan Süre 22:56",
                                style: TextStyle(
                                    color: red,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 9.w, bottom: 7.h),
              child: Text(
                "Playstation 4 pro slim istiyorum. 2 terabyte hafızası olmalı. Yanında spider man oyunu da istiyorum. Mutlaka 2 tane çalışan kol olmalı.",
                style: TextStyle(
                    height: 1.7,
                    color: black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return const LinkCard();
              },
            ),
            PostDetailButton(
              title: 'TEKLİF VER (3.75₺)',
              onTap: () {
                showModalBottomSheet(
                    enableDrag: true,
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Container(
                          width: 400.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(22.r),
                                  topRight: Radius.circular(22.r))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 22.w, bottom: 28.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'TEKLİF VER',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                const SmaillFilledBalance(),
                                SizedBox(
                                  height: 18.h,
                                ),
                                const OfferBalance(),
                                SizedBox(height: 26.h,),
                                AdsEditTextField(
                                  label: 'İlan bağlantınız',
                                  onPressed: () {},
                                ),SizedBox(height: 12.h,),
                                Text('Sadece bağlantı paylaşabilirsiniz.',
                                style: TextStyle(
                                  color: Color(0xff49454F),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400
                                ),
                                ),
                                SizedBox(
                                  height: 55.h,
                                ),
                                Bounceable(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(113.r),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xffFF533C),
                                          Color(0xffFF884B)
                                        ])),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 13.h),
                                      child: Center(
                                        child: Text(
                                          'TEKLİF VER (3.75₺)',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              colors: const [Color(0xffFF543D), Color(0xffFF884B)],
            ),
            SizedBox(
              height: 11.h,
            ),
          ],
        ),
      ),
    );
  }
}



