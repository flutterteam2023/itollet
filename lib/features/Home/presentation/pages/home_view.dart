import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/features/Categories/providers/category_notifier.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final state = ref.watch(homeProvider);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushRoute(PostAddRoute());
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        drawer: CustomDrawer(scaffoldKey: scaffoldKey),
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 18.w,
              right: 18.w,
            ),
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(categories.categories.length, (index) {
                final category = categories.categories[index];
                return Container(
                  width: (MediaQuery.of(context).size.width - 18.w * 5) / 3,
                  height: 128,
                  margin: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Bounceable(
                        onTap: () {
                          context.pushRoute(SubCategoryRoute(category: category));
                        },
                        child: Container(
                          width: 64.w,
                          height: 64.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            gradient: LinearGradient(
                              colors: [category.primaryColor, category.secondaryColor],
                            ),
                          ),
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: category.iconUrl,
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
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      AutoSizeText(
                        category.name,
                        textScaleFactor: textScaleFactor,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
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
    );
  }
}
