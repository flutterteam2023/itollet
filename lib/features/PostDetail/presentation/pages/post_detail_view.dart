import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/common_widgets/link_card.dart';
import 'package:itollet/common_widgets/post_detail_button.dart';
import 'package:itollet/constants/app_image.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';

@RoutePage()
class PostDetailView extends ConsumerWidget {
  const PostDetailView({super.key});
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
                      'İLANIM',
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
              title: 'Düzenle',
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
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'DÜZENLE',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 128.r,
                                  width: 128.r,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: const AssetImage(
                                            'assets/images/phone.png'),
                                        fit: BoxFit.fill,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5),
                                            BlendMode.srcOver),
                                      )),
                                      child: Center(
                                        child: Bounceable(
                                          onTap: () {
                                            
                                          },
                                          child: SvgPicture.asset(AppImage.pencil)),
                                      ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                AdsEditTextField(
                                  label: 'İlan Başlığı',
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                AdsEditTextField(
                                  label: 'Bütçe',
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                AdsEditTextField(
                                  label: 'Açıklama',
                                  onPressed: () {},
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
                                          'KAYDET',
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
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 7.w),
              child: Bounceable(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      color: Colors.white,
                      border: Border.all(width: 3.w, color: black)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    child: Center(
                      child: Text(
                        'KALDIR',
                        style: TextStyle(
                            color: black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AdsEditTextField extends StatelessWidget {
  const AdsEditTextField({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xff1D1B20),
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: const Color(0xff1D1B20),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: onPressed, icon: const Icon(Icons.cancel_outlined)),
          focusColor: const Color(0xff1D1B20),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff1D1B20))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff1D1B20))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff1D1B20))),
          label: Text(
            label,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: const Color(0xff1D1B20)),
          )),
    );
  }
}
