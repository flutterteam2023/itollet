import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';

@RoutePage()
class SubSubCategoryView extends ConsumerWidget {
  const SubSubCategoryView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

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
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffFF884B), Color(0xffFF533C)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    leading: IconButton(onPressed:() {
                      context.back();
                      
                    }, icon: const Icon(Icons.arrow_back_ios)),
                    forceMaterialTransparency: true,
                    surfaceTintColor: Colors.white,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.white,
                    iconTheme: const IconThemeData(color: Colors.white),
                    centerTitle: true,
                    title: Text(
                      'TELEFON',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    backgroundColor:
                        Colors.white, // Arkaplan rengini transparent yapın
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
                  padding:  EdgeInsets.only(left: 12.w,right: 24.w),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                  
                    children:List.generate(10, (index) {
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width-36)/2,
                        child: Padding(
                          padding:  EdgeInsets.only(left: 12.w,bottom: 22.h),
                          child: const SubSubCard(),
                        ));

                    }
                  ),
                ),
              ),
            ),
            )],
        ),
      ),
    );
  }
}

class SubSubCard extends StatelessWidget {
  const SubSubCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r), color: greyCard),
      child: Padding(
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 11.h, bottom: 15.h),
        child: Column(
          children: [
            Container(
              height: 128.r,
              width: 128.r,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(image: AssetImage('assets/images/phone.png'),fit: BoxFit.fill),
                  border: Border.all(width: 3, color: const Color(0xffFF553D))),
                  
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'IPhone 11 128 gb',
              style: TextStyle(
                  color: black, fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '1.000₺',
              style: TextStyle(
                  color: red,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins Italic'),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Kalan Süre 1:59',
              style: TextStyle(
                color: red,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
