import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';

import '../../../../constants/app_image.dart';

@RoutePage()
class SubCategoryView extends ConsumerWidget {
  final CategoryModel category;
  const SubCategoryView(this.category);
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
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [category.primaryColor, category.secondaryColor],
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
                      category.name,
                      style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.w400),
                    ),
                    backgroundColor: Colors.white, // Arkaplan rengini transparent yapın
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.w),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: List.generate(category.subCategories.length, (index) {
                      final subcategory = category.subCategories[index];
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width - 18 * 2) / 3,
                        height: 128,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Bounceable(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [category.primaryColor, category.secondaryColor]),
                                  ),
                                  child: Center(
                                    child: Image.network(
                                      subcategory.iconUrl,
                                      width: 35.w,
                                      height: 35.676.h,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                subcategory.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: black),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
