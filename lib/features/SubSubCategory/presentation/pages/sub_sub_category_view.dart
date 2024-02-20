import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';
import 'package:itollet/features/Categories/models/subcategory/subcategory_model.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';
import 'package:itollet/iberkeugur/Log/log.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class SubSubCategoryView extends ConsumerStatefulWidget {
  final CategoryModel categoryModel;
  final SubcategoryModel subcategoryModel;
  final List<PostModel> postModel;
  const SubSubCategoryView(this.subcategoryModel, this.postModel, this.categoryModel, {super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SubSubCategoryViewState();
}

class _SubSubCategoryViewState extends ConsumerState<SubSubCategoryView> {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
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
                        colors: [widget.categoryModel.primaryColor, widget.categoryModel.secondaryColor],
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
                          icon: const Icon(Icons.arrow_back_ios)),
                      forceMaterialTransparency: true,
                      surfaceTintColor: Colors.white,
                      foregroundColor: Colors.white,
                      shadowColor: Colors.white,
                      iconTheme: const IconThemeData(color: Colors.white),
                      centerTitle: true,
                      title: AutoSizeText(
                        textScaleFactor: textScaleFactor,
                        widget.subcategoryModel.name,
                        style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.w400),
                      ),
                      backgroundColor: Colors.white, // Arkaplan rengini transparent yapın
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              SizedBox(
                height: 700.h,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w, right: 24.w),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: List.generate(widget.postModel.length, (index) {
                        final post = widget.postModel[index];
                        DateTime suan = DateTime.now();
                        DateTime ilanBitisTarihi = post.createdAt!.add(const Duration(hours: 24));
                        Duration kalanSure = ilanBitisTarihi.difference(suan);
                        int kalanSaat = kalanSure.inHours;
                        int kalanDakika = (kalanSure.inMinutes - kalanSaat * 60);
                        return kalanSaat >= 0
                            ? SizedBox(
                                width: (MediaQuery.of(context).size.width - 36) / 2,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 12.w, bottom: 22.h),
                                  child: Bounceable(
                                    onTap: () {
                                      if (post.fromUID == FirebaseAuth.instance.currentUser?.uid) {
                                        context.pushRoute(
                                            PostDetailRoute(postModel: post, categoryModel: widget.categoryModel));
                                      } else {
                                        context
                                            .pushRoute(AdsRoute(postModel: post, categoryModel: widget.categoryModel));
                                      }
                                    },
                                    child: SubSubCard(
                                      title: post.title,
                                      maxprice: post.balanceMax.toString(),
                                      minPrice: post.balanceMin.toString(),
                                      kalanDakika: kalanDakika,
                                      kalanSaat: kalanSaat,
                                      imageUrl: post.photoUrl!,
                                      categoryModel: widget.categoryModel,
                                    ),
                                  ),
                                ))
                            : const SizedBox.shrink();
                      }),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SubSubCard extends StatelessWidget {
  const SubSubCard({
    super.key,
    required this.title,
    required this.maxprice,
    required this.minPrice,
    required this.imageUrl,
    required this.categoryModel,
    required this.kalanDakika,
    required this.kalanSaat,
  });
  final String title;
  final String maxprice;
  final String minPrice;
  final int kalanDakika;
  final int kalanSaat;
  final String imageUrl;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.r), color: greyCard),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 11.h, bottom: 15.h),
        child: Column(
          children: [
            Container(
              height: 128.r,
              width: 128.r,
              // ignore: sort_child_properties_last

              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3, color: categoryModel.primaryColor),
                gradient: RadialGradient(
                  colors: [categoryModel.primaryColor, categoryModel.secondaryColor],
                  tileMode: TileMode.clamp,
                  radius: .8,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            AutoSizeText(
              textScaleFactor: textScaleFactor,
              title,
              style: TextStyle(color: black, fontSize: 16.sp, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5.h,
            ),
            AutoSizeText(
              textScaleFactor: textScaleFactor,
              "En fazla: $maxprice ₺",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: categoryModel.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            AutoSizeText(
              textScaleFactor: textScaleFactor,
              "En az: $minPrice ₺",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: categoryModel.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            AutoSizeText(
              textScaleFactor: textScaleFactor,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "Kalan Süre: ${kalanSaat.toString().padLeft(2, '0')}:${kalanDakika.toString().padLeft(2, '0')}",
              style: TextStyle(
                color: categoryModel.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
