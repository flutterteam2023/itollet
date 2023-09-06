import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/app_image.dart';
import 'package:itollet/constants/constant_colors.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: EdgeInsets.only(
          top: 50.h,
          left: 26.w,
          right: 26.w
        ),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1.6.h),
          children: [
            Category(
              onTap: () {},
              title: "ARAÇ",
              ellipsePath: AppImage.blueEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "BEBEK",
              ellipsePath: AppImage.pinkEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "ÇOCUK",
              ellipsePath: AppImage.greenEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "ELEKTRONİK",
              ellipsePath: AppImage.orangeEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "SPOR",
              ellipsePath: AppImage.purpleEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "KADIN",
              ellipsePath: AppImage.pinkEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "BEYAZ EŞYA",
              ellipsePath: AppImage.greenEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "YEDEK PARÇA",
              ellipsePath: AppImage.blueEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "ERKEK",
              ellipsePath: AppImage.orangeEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "EVCİL HAYVAN",
              ellipsePath: AppImage.purpleEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "MOBİLYA",
              ellipsePath: AppImage.pinkEllipse,
              iconPath: AppImage.iconCar,
            ),
            Category(
              onTap: () {},
              title: "AKSESUAR",
              ellipsePath: AppImage.greenEllipse,
              iconPath: AppImage.iconCar,
            ),
            

          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.title,
    required this.ellipsePath,
    required this.iconPath,
    required this.onTap,
  });
  final String title;
  final String ellipsePath;
  final String iconPath;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Bounceable(
          onTap: onTap,
          child: Stack(
            children: [
              SvgPicture.asset(
                ellipsePath,
                width: 64.r,
                height: 64.r,
                fit: BoxFit.scaleDown,
              ),
              Positioned(
                  top: 17.h,
                  bottom: 16.32.h,
                  left: 13.w,
                  right: 13.w,
                  child: SvgPicture.asset(
                    iconPath,
                    width: 32.w,
                    height: 30.676.h,
                  ))
            ],
          ),
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.w500, color: black),
        )
      ],
    );
  }
}
