import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class LoginPasswordInfoView extends ConsumerWidget {
  const LoginPasswordInfoView({super.key});
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
        title:  AutoSizeText("GİRİŞ & ŞİFRE",
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Giriş Bilgileri',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold
            
      
            ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text('Kullanıcı adı veya e-posta adresi: Kullanıcının hesabına erişmek için kullandığı tanımlayıcı bilgi.'),
            SizedBox(
              height: 20.h,
            ),
            const Text('Şifre: Kullanıcının hesabına erişmek için gerekli olan güvenlik kodu.'),
            SizedBox(
              height: 20.h,
            ),

            const Text('Giriş butonu: Kullanıcıların bu bilgileri girdikten sonra sisteme girebilecekleri buton.'),

            SizedBox(
              height: 20.h,
            ),
            Text('Şifre İle İlgili Bilgiler',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold
            
      
            ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Text('Şifre oluşturma kriterleri: Genellikle bir güçlü şifrenin belirli kriterlere uyması gerekir. Bu kriterler genellikle büyük harfler, küçük harfler, rakamlar ve sembollerin kullanımını içerir.'),
            SizedBox(
              height: 20.h,
            ),
            const Text('Şifre unutma veya sıfırlama adımları: Kullanıcıların şifrelerini unutmaları durumunda ne yapmaları gerektiğine dair bilgiler, genellikle bir şifre sıfırlama bağlantısı veya prosedürü içerir.'),
          ],
        ),
      ),
    );
  }
}