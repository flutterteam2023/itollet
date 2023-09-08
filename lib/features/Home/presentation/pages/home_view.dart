import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/category.dart';
import 'package:itollet/constants/app_image.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Categories/providers/category_notifier.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);
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
        padding: EdgeInsets.only(top: 50.h, left: 50.w, right: 50.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 30.h, mainAxisSpacing: 30),
          itemCount: categories.categories.length,
          itemBuilder: (context, index) {
            final category = categories.categories[index];
            return Column(
             
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        category.primaryColor,
                        category.secondaryColor
                      ]),
                    ),
                    child: Center(
                      child: Image.network(
                        category.iconUrl,
                        width: 35.w,
                        height: 35.676.h,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(category.name,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: black
                ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

// categories.categories.first.primaryColor,
//                       categories.categories.first.secondaryColor,