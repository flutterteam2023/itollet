import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/common_widgets/link_card.dart';
import 'package:itollet/common_widgets/post_detail_button.dart';
import 'package:itollet/common_widgets/show_modal_bottom_sheet.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/features/PostDetail/presentation/providers/post_detail_notifier.dart';
import 'package:itollet/iberkeugur/Log/log.dart';

@RoutePage()
class PostDetailView extends HookConsumerWidget {
  final PostModel postModel;
  final CategoryModel categoryModel;
  const PostDetailView(this.postModel, this.categoryModel, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final scaffoldKey = GlobalKey<ScaffoldState>();
 final titleController = useTextEditingController(text: '');
    final budgetController = useTextEditingController(text: '');
    final descriptionController = useTextEditingController(text: '');
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
                      colors: [categoryModel.primaryColor, categoryModel.secondaryColor],
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
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    forceMaterialTransparency: true,
                    surfaceTintColor: Colors.white,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.white,
                    iconTheme: const IconThemeData(color: Colors.white),
                    centerTitle: true,
                    title: Text(
                      'İLANIM',
                      style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.w400),
                    ),
                    backgroundColor: Colors.white, // Arkaplan rengini transparent yapın
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 11.w, top: 16.h),
              child: Container(
                decoration: BoxDecoration(
                  color: greyCard,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 13.w, top: 17.h, bottom: 17.h, right: 13.w),
                  child: Row(
                    children: [
                      Container(
                        height: 128.r,
                        width: 128.r,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: CachedNetworkImage(
                            imageUrl: postModel.photoUrl,
                            fit: BoxFit.fill,
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
                          border: Border.all(color: categoryModel.primaryColor, width: 2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: SizedBox(
                          width: 214.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                postModel.title,
                                style: TextStyle(color: black, fontSize: 20.sp, fontWeight: FontWeight.w500),
                                maxLines: 2,
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Text(
                                "Bütçe ${postModel.description}₺",
                                style: TextStyle(color: categoryModel.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Kalan Süre: ${postModel.createdAt!.hour}: ${postModel.createdAt!.minute}",
                                style: TextStyle(color: categoryModel.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 9.w, bottom: 7.h),
              child: Text(
                postModel.description,
                style: TextStyle(height: 1.7, color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
            StreamBuilder<List<String>>(
              stream: ref.watch(homeProvider.notifier).getPostUrlsStream(postModel.postId!),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Data gelmedi');
                  
                }if (snapshot.hasData) {
                  List<String> urls = snapshot.data ?? [];
                  return SizedBox(
                    height: 300.h,
                    child: ListView.builder(
                    itemCount: urls.length,
                    itemBuilder: (context, index) {
                      return LinkCard(
                        url: urls[index],
                        categoryModel: categoryModel,
                        onTap: () {
                          ref
                              .read(postDetailProvider.notifier)
                              .launchUrls(urls[index]);
                        },
                      );
                    },
                                  ),
                  );
                  
                }
                return SizedBox.shrink();
                
              }
            ),
            PostDetailButton(
              title: 'Düzenle',
              onTap: () {
                CustomBottomSheet().ModalBottomSheet(context,titleController,budgetController,descriptionController);
              },
              colors: [categoryModel.primaryColor, categoryModel.secondaryColor],
            ),
            SizedBox(
              height: 11.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 7.w),
              child: Bounceable(
                onTap: () {},
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(18.r), color: Colors.white, border: Border.all(width: 3.w, color: black)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    child: Center(
                      child: Text(
                        'KALDIR',
                        style: TextStyle(color: black, fontSize: 20.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
