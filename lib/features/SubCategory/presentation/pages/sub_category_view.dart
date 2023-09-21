import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/iberkeugur/Log/log.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class SubCategoryView extends ConsumerWidget {
  final CategoryModel category;
  const SubCategoryView(this.category, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final state = ref.watch(homeProvider);

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
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [category.primaryColor, category.secondaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: AppBar(
                    iconTheme: const IconThemeData(color: Colors.white),
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                        onPressed: () {
                          context.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    centerTitle: true,
                    title: Text(
                      category.name,
                      style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.w400),
                    ),
                    backgroundColor: Colors.transparent, // Arkaplan rengini transparent yapın
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
                      List<PostModel> postModel = [];

                      final subcategory = category.subCategories[index];
                      for (var e in state.postModels) {
                        if (subcategory.id == e.categoryID) {
                          postModel.add(e);
                        }
                      }
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width - 18 * 2) / 3,
                        height: 128,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Bounceable(
                                onTap: () {
                                  context
                                      .pushRoute(SubSubCategoryRoute(subcategoryModel: subcategory, postModel: postModel, categoryModel: category));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [category.primaryColor, category.secondaryColor]),
                                  ),
                                  child: Center(
                                    child: CachedNetworkImage(
                                      imageUrl: subcategory.iconUrl,
                                      color: Colors.white,
                                      width: 35.w,
                                      height: 35.676.h,
                                      progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox.square(
                                        dimension: 15,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                          value: downloadProgress.progress,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) {
                                        Log.instance.error(error);
                                        return const Icon(Icons.error_outline);
                                      },
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
