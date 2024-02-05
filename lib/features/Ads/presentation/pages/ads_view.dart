import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
class AdsView extends StatefulHookConsumerWidget {
  final CategoryModel categoryModel;
  final PostModel postModel;
  const AdsView(this.categoryModel, this.postModel, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdsViewState();
}
class _AdsViewState extends ConsumerState<AdsView> {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final urlController = useTextEditingController(text: '');
    final homestate = ref.watch(homeProvider);
   late Timer _timer;
    final descriptionController = useTextEditingController(text: '');
    DateTime suan = DateTime.now();
    DateTime ilanBitisTarihi =
        widget.postModel.createdAt!.add(Duration(hours: 24));
    Duration kalanSure = ilanBitisTarihi.difference(suan);
    
    void _updateTimer(Timer timer) {
    DateTime suan = DateTime.now();
    DateTime ilanBitisTarihi = widget.postModel.createdAt!.add(const Duration(hours: 24));
    setState(() {
      kalanSure = ilanBitisTarihi.difference(suan);
    });

    if (kalanSure.isNegative) {
      _timer.cancel(); // Geri sayım tamamlandığında timer'ı iptal et
    }
  }
     @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), _updateTimer);
  }
    @override
  void dispose() {
    _timer.cancel(); // Widget kaldırıldığında timer'ı temizle
    super.dispose();
  }
  int kalanSaat = kalanSure.inHours;
    int kalanDakika = (kalanSure.inMinutes - kalanSaat * 60);
    

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
                        'İLAN SAHİBİ ADI',
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
                          decoration: BoxDecoration(
                            border: Border.all(color: widget.categoryModel.primaryColor, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: CachedNetworkImage(
                              imageUrl: widget.postModel.photoUrl,
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
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: SizedBox(
                              width: 214.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    widget.postModel.title,
                                    style: TextStyle(color: black, fontSize: 20.sp, fontWeight: FontWeight.w500),
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  Text(
                                    "Max Bütçe: ${widget.postModel.balanceMax}₺",
                                    style: TextStyle(color: widget.categoryModel.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Min Bütçe: ${widget.postModel.balanceMin}₺",
                                    style: TextStyle(color: widget.categoryModel.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Kalan Süre: ${kalanSaat.toString().padLeft(2, '0')}:${kalanDakika.toString().padLeft(2, '0')}",
                                    style: TextStyle(color: widget.categoryModel.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
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
                  widget.postModel.description,
                  style: TextStyle(height: 1.7, color: black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                ),
              ),
           // ignore: unnecessary_null_comparison
              StreamBuilder(
                stream: ref.watch(homeProvider.notifier).getPostUrlStream(widget.postModel.postId!),
                builder: (context,builder) {
                  return SizedBox(
                    height: 380.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      // ignore: unnecessary_null_comparison
                      itemCount:homestate.postUrls.length,
                      itemBuilder: (context, index) {
                        final url = homestate.postUrls[index];
                        return LinkCard(
                          onTap: () {
                             ref
                            .read(postDetailProvider.notifier)
                            .launchUrls(url,widget.postModel.postId!);
                          },
                          categoryModel: widget.categoryModel,
                          url: url,
                        );
                      },
                    ),
                  );
                }
              ),
              PostDetailButton(
                title: 'TEKLİF VER (3.75₺)',
                onTap: () {
                  CustomBottomSheet().AdsModalBottomSheet(context,widget.categoryModel,urlController,(){
                    ref.read(homeProvider.notifier).postUrl(widget.postModel.postId!, urlController.text,context);
                  });
                  urlController.text='';
                },
                colors: [widget.categoryModel.primaryColor, widget.categoryModel.secondaryColor],
              ),
              SizedBox(
                height: 11.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


