import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/constants/app_image.dart';
import 'package:itollet/constants/constant_colors.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          AppImage.logo,
          width: 136.w,
          height: 49.h,
        ),
        leading: Bounceable(
            onTap: () {},
            child: SvgPicture.asset(
              AppImage.menuIcon,
              width: 48.r,
              height: 48.r,
              fit: BoxFit.scaleDown,
            )),
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/phone.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 18.sp,
                  ),
                  Text(
                    "BERKE UĞUR",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                  Text(
                    "berkeugur67@gmail.com",
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
                  Padding(
                    padding:
                        EdgeInsets.only(left: 18.w, right: 18.w, top: 18.w),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        ElementEllipse(
                          title: 'İLANLARIM',
                          colors: const [Color(0xffFF553D), Color(0xffFF864B)],
                          onTap: () {},
                        ),
                        ElementEllipse(
                          title: 'CÜZDANIM',
                          colors: const [Color(0xff5CC65D), Color(0xff2CA882)],
                          onTap: () {},
                        ),
                        ElementEllipse(
                          title: 'GİZLİLİK',
                          colors: const [Color(0xff0046A5), Color(0xff50D7E0)],
                          onTap: () {},
                        ),
                        ElementEllipse(
                          title: 'YARDIM',
                          colors: const [Color(0xff834AFA), Color(0xffD14C88)],
                          onTap: () {},
                        ),
                        ElementEllipse(
                          title: 'DEĞERLENDİR',
                          colors: const [Color(0xffFFAEF6), Color(0xffFFE0C6)],
                          onTap: () {},
                        ),
                        ElementEllipse(
                          title: 'ÇIKIŞ YAP',
                          colors: const [Color(0xffFED552), Color(0xffFF8099)],
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ElementEllipse extends StatelessWidget {
  const ElementEllipse({
    super.key,
    required this.title,
    required this.colors,
    required this.onTap,
  });
  final String title;
  final List<Color> colors;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 18 * 3) / 3,
        height: 128,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Bounceable(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: colors),
                  ),
                  child: Center(child: SvgPicture.asset('assets/svg/exit.svg')),
                ),
              ),
            ),
            SizedBox(height: 5.h,),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13.sp, fontWeight: FontWeight.w500, color: black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
