import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itollet/constants/app_image.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/routing/app_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            onTap: () {
              context.pushRoute(ProfileRoute());
            },
            child: Container(
              height: 45.r,
              width: 45.r,
              decoration: BoxDecoration(color: secondary, borderRadius: BorderRadius.circular(30.r)),
              child: const Center(
                  child: Icon(
                Icons.person_outlined,
                color: Colors.white,
              )),
            ),
          ),
        )
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}