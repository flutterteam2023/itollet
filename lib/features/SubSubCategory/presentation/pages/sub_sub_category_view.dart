import 'package:auto_route/auto_route.dart';
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
                  decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      colors: [widget.categoryModel.primaryColor, widget.categoryModel.secondaryColor],
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
                      widget.subcategoryModel.name,
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
                  
                    children:List.generate(widget.postModel.length, (index) {
                      final post = widget.postModel[index];
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width-36)/2,
                        child: Padding(
                          padding:  EdgeInsets.only(left: 12.w,bottom: 22.h),
                          child:  Bounceable(
                            onTap: () {
                              if (post.fromUID== FirebaseAuth.instance.currentUser?.uid) {
                                context.pushRoute( PostDetailRoute(postModel: post,categoryModel: widget.categoryModel));
                                
                              }else{
                                context.pushRoute( AdsRoute(postModel: post,categoryModel: widget.categoryModel));
                              }
                              
                            },
                            child: SubSubCard(
                              title:post.title,
                              price: post.description,
                              time: post.createdAt!,
                              imageUrl: post.photoUrl,
                              categoryModel:widget.categoryModel,
                            ),
                          ),
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
    super.key, required this.title, required this.price, required this.time, required this.imageUrl, required this.categoryModel,
  });
  final String title;
  final String price;
  final DateTime time;
  final String imageUrl;
  final CategoryModel categoryModel;
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
                  image:  DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill),
                  border: Border.all(width: 3, color: categoryModel.primaryColor)),
                  
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: TextStyle(
                  color: black, fontSize: 16.sp, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "$price ₺",
              style: TextStyle(
                  color: categoryModel.primaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins Italic'),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Kalan Süre: ${time.hour}:${time.minute}',
              style: TextStyle(
                color: categoryModel.primaryColor,
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
