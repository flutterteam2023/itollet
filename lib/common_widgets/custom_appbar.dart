import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
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
          return SizedBox.square(
            dimension: 32.w,
            child: Bounceable(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
                child: Center(
                    child: Icon(
                  Iconsax.menu_1,
                  size: 32,
                )),
              ),
            ),
          );
        },
      ),
      actions: [
        Bounceable(
          onTap: () {
            context.pushRoute(const ProfileRoute());
          },
          child: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const Center(
                child: Icon(
              Iconsax.user,
              size: 32,
            )),
          ),
        ),
        const SizedBox(width: 9),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
