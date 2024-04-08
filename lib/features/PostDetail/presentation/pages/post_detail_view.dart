import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:itollet/routing/app_router.dart';
import 'package:itollet/utils/price_converter.dart';

@RoutePage()
class PostDetailView extends StatefulHookConsumerWidget {
  final PostModel postModel;
  final CategoryModel? categoryModel;
  const PostDetailView(this.postModel, this.categoryModel, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends ConsumerState<PostDetailView> {
  PostModel? postmodel;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final titleController = useTextEditingController(text: '');
    final maxBalance = useTextEditingController(text: '');
    final minBalance = useTextEditingController(text: '');
    late Timer timer;
    final descriptionController = useTextEditingController(text: '');
    DateTime suan = DateTime.now();
    DateTime ilanBitisTarihi = widget.postModel.createdAt!.add(const Duration(hours: 24));
    Duration kalanSure = ilanBitisTarihi.difference(suan);
    final isloading = useState(false);

    void updateTimer(Timer timer) {
      DateTime suan = DateTime.now();
      DateTime ilanBitisTarihi = widget.postModel.createdAt!.add(const Duration(hours: 24));
      setState(() {
        kalanSure = ilanBitisTarihi.difference(suan);
      });

      if (kalanSure.isNegative) {
        timer.cancel(); // Geri sayım tamamlandığında timer'ı iptal et
      }
    }

    @override
    void initState() {
      super.initState();
      timer = Timer.periodic(const Duration(seconds: 1), updateTimer);
    }

    @override
    void dispose() {
      timer.cancel(); // Widget kaldırıldığında timer'ı temizle
      super.dispose();
    }

    int kalanSaat = kalanSure.inHours;
    int kalanDakika = (kalanSure.inMinutes - kalanSaat * 60);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
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
                        colors: [
                          widget.categoryModel != null ? widget.categoryModel!.primaryColor : secondary,
                          widget.categoryModel != null ? widget.categoryModel!.secondaryColor : secondary
                        ],
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
                      title: AutoSizeText(
                        textScaleFactor: textScaleFactor,
                        'İLANIM',
                        style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.w400),
                      ),
                      backgroundColor: Colors.white, // Arkaplan rengini transparent yapın
                    ),
                  ),
                ),
              ),
              isloading.value == false
                  ? FutureBuilder(
                      future: postmodel != null
                          ? Future.delayed(Duration.zero)
                          : FirebaseFirestore.instance.collection('posts').doc(widget.postModel.postId).get(),
                      builder: (context, postSnapshot) {
                        if (postmodel == null) {
                          if (postSnapshot.hasError) {
                            return AutoSizeText(
                              'Data gelmedi',
                              textScaleFactor: textScaleFactor,
                            );
                          }

                          if (!postSnapshot.hasData) {
                            return const CircularProgressIndicator(
                              color: Colors.purple,
                            );
                          }
                          if (postSnapshot.data == null) {
                            return const CircularProgressIndicator();
                          }
                          final postData = postSnapshot.data;
                          postmodel = PostModel.fromJson(postData?.data() as Map<String, dynamic>);
                        }

                        if (true) {
                          PostModel? postModel = postmodel!;
                          print(postmodel?.toJson());
                          return Column(
                            children: [
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
                                          height: 128.w,
                                          width: 128.w,

                                          // ignore: sort_child_properties_last
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: CachedNetworkImage(
                                              imageUrl: postModel.photoUrl ?? '',
                                              fit: BoxFit.contain,
                                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                  SizedBox.square(
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
                                            gradient: LinearGradient(
                                              colors: [
                                                widget.categoryModel?.primaryColor ?? secondary,
                                                widget.categoryModel?.secondaryColor ?? secondary,
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(18),
                                            border: Border.all(
                                              color: widget.categoryModel != null
                                                  ? widget.categoryModel!.primaryColor
                                                  : secondary,
                                              width: 2,
                                            ),
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
                                                  textScaleFactor: textScaleFactor,
                                                  postModel.title,
                                                  style: TextStyle(
                                                      color: black, fontSize: 20.sp, fontWeight: FontWeight.w500),
                                                  maxLines: 2,
                                                ),
                                                SizedBox(
                                                  height: 14.h,
                                                ),
                                                AutoSizeText(
                                                  textScaleFactor: textScaleFactor,
                                                  "Max Bütçe: ${priceConverter(postModel.balanceMax)}₺",
                                                  style: TextStyle(
                                                      color: widget.categoryModel != null
                                                          ? widget.categoryModel!.primaryColor
                                                          : secondary,
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                AutoSizeText(
                                                  textScaleFactor: textScaleFactor,
                                                  "Min Bütçe: ${priceConverter(postModel.balanceMin)}₺",
                                                  style: TextStyle(
                                                      color: widget.categoryModel != null
                                                          ? widget.categoryModel!.primaryColor
                                                          : secondary,
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                kalanSaat >= 0
                                                    ? AutoSizeText(
                                                        textScaleFactor: textScaleFactor,
                                                        "Kalan Süre: ${kalanSaat.toString().padLeft(2, '0')}: ${kalanDakika.toString().padLeft(2, '0')}",
                                                        style: TextStyle(
                                                            color: widget.categoryModel != null
                                                                ? widget.categoryModel!.primaryColor
                                                                : secondary,
                                                            fontSize: 16.sp,
                                                            fontWeight: FontWeight.w600),
                                                      )
                                                    : const SizedBox.shrink()
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
                                child: AutoSizeText(
                                  textScaleFactor: textScaleFactor,
                                  postModel.description!,
                                  style: TextStyle(
                                      height: 1.7, color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      })
                  : const SizedBox.shrink(),
              StreamBuilder<List<String>>(
                  stream: ref.watch(homeProvider.notifier).getPostUrlsStream(widget.postModel.postId!),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return AutoSizeText(
                        'Data gelmedi',
                        textScaleFactor: textScaleFactor,
                      );
                    }
                    if (snapshot.hasData) {
                      List<String> urls = snapshot.data ?? [];

                      return SizedBox(
                        height: 250.h,
                        child: ListView.builder(
                          itemCount: urls.length,
                          itemBuilder: (context, index) {
                            return LinkCard(
                              url: urls[index],
                              categoryModel: widget.categoryModel,
                              onTap: () {
                                ref.read(postDetailProvider.notifier).launchUrls(urls[index], widget.postModel.postId!);
                              },
                            );
                          },
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
              PostDetailButton(
                title: 'Düzenle',
                onTap: () async {
                  await CustomBottomSheet()
                      .modalBottomSheet(
                    context,
                    titleController,
                    maxBalance,
                    minBalance,
                    descriptionController,
                    postmodel == null ? widget.postModel : postmodel!,
                  )
                      .then((value) {
                    if (value == true) {
                      postmodel = null;
                      Log.instance.success("updated feed");
                      setState(() {});
                    }
                  });
                },
                colors: [
                  widget.categoryModel != null ? widget.categoryModel!.primaryColor : secondary,
                  widget.categoryModel != null ? widget.categoryModel!.secondaryColor : secondary
                ],
              ),
              SizedBox(
                height: 11.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Bounceable(
                  onTap: () async {
                    isloading.value = true;
                    FirebaseFirestore.instance.collection('posts').doc(widget.postModel.postId).delete().then((value) {
                      isloading.value = false;
                      context.pushRoute(const HomeRoute());
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      border: Border.all(
                        width: 3.w,
                        color: black,
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Center(
                        child: isloading.value == false
                            ? AutoSizeText(
                                textScaleFactor: textScaleFactor,
                                'KALDIR',
                                style: TextStyle(color: black, fontSize: 20.sp, fontWeight: FontWeight.w400),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.purple,
                              ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
