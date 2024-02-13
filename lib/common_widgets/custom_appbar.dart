import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      title: Bounceable(
        onTap: () {
          context.pushRoute(const HomeRoute());
        
        },
        child: Image.asset(
          AppImage.logo,
          width: 136.w,
          height: 49.h,
        ),
      ),
      leading: Builder(
        builder: (context) {
          return Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: Bounceable(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                height: 40.r,
                width: 40.r,
                decoration: const BoxDecoration(color: secondary,shape: BoxShape.circle),
                child: const Center(
                    child: Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
              ),
            ),
          );
        },
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 18.w),
          child: Bounceable(
            onTap: () {
              context.pushRoute(const ProfileRoute());
            },
            child: Container(
              height: 40.r,
              width: 40.r,
              decoration: const BoxDecoration(color: secondary,shape: BoxShape.circle),
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}