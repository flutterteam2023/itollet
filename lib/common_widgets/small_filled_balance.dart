import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';

class SmaillFilledBalance extends ConsumerWidget {
 final CategoryModel categoryModel;

  const SmaillFilledBalance( this.categoryModel, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final state = ref.watch(homeProvider);
    return StreamBuilder<UserModel>(
      stream: ref.watch(homeProvider.notifier).getStreamUser(),

      builder: (context,snapshot) {
        if (snapshot.hasError) {
          return  AutoSizeText('Data gelmedi',
          textScaleFactor: textScaleFactor,
          );
          
          
        }if(snapshot.hasData){
          return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(114.r),
              gradient:  LinearGradient(
                  colors: [categoryModel.primaryColor, categoryModel.secondaryColor])),
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.w, right: 17.w, top: 5.h, bottom: 5.h),
            child: AutoSizeText(
              'BAKİYENİZ: ${state.streamUser.balance}₺',
              textScaleFactor: textScaleFactor,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        );
        }
        return const SizedBox.shrink();
        
      }
    );
  }
}

 