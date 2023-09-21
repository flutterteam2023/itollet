import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';

@RoutePage()
class MyAdsView extends ConsumerWidget {
  const MyAdsView({super.key});
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
                  decoration: const BoxDecoration(color: secondary),
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
                    title: Text(
                      'İLANLARIM',
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
                    children: List.generate(state.myPostList.length, (index) {
                      final myPost = state.myPostList[index];
                      return SizedBox(
                          width: (MediaQuery.of(context).size.width - 36) / 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.w, bottom: 22.h),
                            child: SubSubCard(
                              description: myPost.title,
                              price: myPost.balanceMax,
                              time: myPost.createdAt!.hour.toString(),
                              url: myPost.photoUrl,
                              onTap: () {},
                            ),
                          ));
                    }),
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

class SubSubCard extends StatelessWidget {
  const SubSubCard({
    super.key,
    required this.onTap,
    required this.url,
    required this.description,
    required this.price,
    required this.time,
  });
  final void Function() onTap;
  final String url;
  final String description;
  final String? price;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.r), color: greyCard),
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 11.h, bottom: 15.h),
          child: Column(
            children: [
              Container(
                height: 128.r,
                width: 128.r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
                    border: Border.all(width: 3, color: secondary)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(color: black, fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '$price₺',
                style: TextStyle(color: secondary, fontSize: 16.sp, fontWeight: FontWeight.w600, fontFamily: 'Poppins Italic'),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Kalan Süre : $time',
                style: TextStyle(
                  color: secondary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
