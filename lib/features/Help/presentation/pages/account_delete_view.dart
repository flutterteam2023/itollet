import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class AccountDeleteView extends ConsumerWidget {
  const AccountDeleteView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.popRoute();
            },
            icon: const Icon(Icons.clear)),
        title:  AutoSizeText("Hesap Silme",
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h,bottom: 50.h),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text('Kullanıcılar:',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold
              
        
              ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Diledikleri zaman hesaplarını silebilirler.'),
              SizedBox(
                height: 20.h,
              ),
              const Text('Hesap silme işlemi geri döndürülemez.'),
              SizedBox(
                height: 20.h,
              ),
              const Text('Hesap silindikten sonra tüm veriler silinir.'),
              SizedBox(
                height: 20.h,
              ),
              Text('Satıcılar',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold
              
        
              ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Hesap silmeden önce bakiyelerini kullanmalı veya geri ödeme yapmalılar.'),
              SizedBox(
                height: 20.h,
              ),
              const Text('Hesap silme, devam eden satışları etkilemez.'),
              SizedBox(
                height: 20.h,
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}