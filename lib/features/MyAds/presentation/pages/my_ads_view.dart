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
class MyAdsView extends ConsumerStatefulWidget {
  const MyAdsView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAdsViewState();
}

class _MyAdsViewState extends ConsumerState<MyAdsView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      ref.watch(homeProvider.notifier).getPosts();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
            SingleChildScrollView(
              child: SizedBox(
                height: 600.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 24.w),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: List.generate(state.myPostList.length, (index) {
                      final myPost = state.myPostList[index];
                      DateTime suan = DateTime.now();
                        DateTime ilanBitisTarihi =
                            myPost.createdAt!.add(const Duration(hours: 24));
                        Duration kalanSure = ilanBitisTarihi.difference(suan);
                        int kalanSaat = kalanSure.inHours;
                        int kalanDakika =
                            (kalanSure.inMinutes - kalanSaat * 60);
                      return kalanSaat>=0? SizedBox(
                          width: (MediaQuery.of(context).size.width - 36) / 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.w, bottom: 22.h),
                            child: SubSubCard(
                              isTimeFinish: false,
                              description: myPost.title,
                              price: myPost.balanceMax,
                              kalanSaat: kalanSaat,
                              kalanDakika: kalanDakika,
                              url: myPost.photoUrl,
                              onTap: () {},
                            ),
                          )):SizedBox(
                          width: (MediaQuery.of(context).size.width - 36) / 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.w, bottom: 22.h),
                            child: SubSubCard(
                              isTimeFinish: true,
                              description: myPost.title,
                              price: myPost.balanceMax,
                              url: myPost.photoUrl,
                              onTap: () {},
                              kalanSaat:null,
                              kalanDakika:null,
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
    required this.kalanSaat,required this.kalanDakika, required this.isTimeFinish,
  });
  final void Function() onTap;
  final String url;
  final String description;
  final String? price;
  final int? kalanSaat;
  final int? kalanDakika;
  final bool isTimeFinish;
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
               kalanSaat!=null&&kalanDakika!=null? 'Kalan Süre : ${kalanSaat.toString().padLeft(2, '0')}:${kalanDakika.toString().padLeft(2, '0')}':"",
                style: TextStyle(
                  color: secondary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.h,),
              Text(isTimeFinish==false?'Aktif':'İlan Süresi Dolan',
              style: TextStyle(
                color: secondary,
                fontSize:15.sp,
                fontWeight: FontWeight.bold 
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
