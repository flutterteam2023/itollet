import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class PaymentRefundView extends ConsumerWidget {
  const PaymentRefundView({super.key});
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
        title:  AutoSizeText("Genel",
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h,bottom: 50.h),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Itollet, kullanıcıların istedikleri ürünleri kolayca bulmalarına ve satıcıların doğrudan bu taleplere cevap vermelerine olanak tanıyan yenilikçi bir platformdur. İşte uygulamamızın temel özellikleri ve işlevleri:'),
              SizedBox(
                height: 20.h,
              ),
              Text('Kullanıcı Talepleri',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold
              
        
              ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Kullanıcılar, istedikleri ürünlerin detaylarını belirterek taleplerini oluşturabilirler. Ürün adı, özellikleri, fiyat aralığı gibi kriterlerle taleplerini özelleştirebilirler.'),
              SizedBox(
                height: 20.h,
              ),
              Text('Satıcı Katılımı',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold
              
        
              ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Uygulamaya kayıt olan satıcılar, kullanıcı taleplerine uygun ürünleri bulup doğrudan ilgili kullanıcılara teklif sunabilirler. Bu sayede satıcılar, potansiyel müşterilere doğrudan erişim sağlarlar.'),
              SizedBox(
                height: 20.h,
              ),
              Text('Bağlantı Paylaşımı',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold
              
        
              ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Satıcılar, kullanıcıların taleplerine uygun ürünlerin bulunduğu sitelerin bağlantılarını paylaşarak kullanıcılara yönlendirirler. Kullanıcılar da bu bağlantılar aracılığıyla istedikleri ürünlere hızlıca erişebilirler.'),
              SizedBox(
                height: 20.h,
              ),
              Text('Bakiye Tabanlı Link Paylaşımı',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold
              
        
              ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Satıcılar, kullanıcıların taleplerine bağlantı paylaşmak için uygulama içinde bulunan bakiyelerinden harcarlar. Her bağlantı paylaşımı, satıcının bakiyesinden düşülür.'),
              SizedBox(
                height: 20.h,
              ),
              Text('Çoklu Satıcı Seçeneği',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold
              
        
              ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Kullanıcılar, aynı ürün için birden fazla satıcının teklifini karşılaştırabilir ve en uygun fiyatı bulabilirler.'),
              SizedBox(
                height: 20.h,
              ),
              Text('Kolay Kullanım',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold
              
        
              ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Basit arayüzü sayesinde kullanıcılar ve satıcılar, uygulamayı kolayca kullanabilir ve istedikleri ürünlere hızlıca erişebilirler.'),
              
            ],
          ),
        ),
      ),
    );
  }
}