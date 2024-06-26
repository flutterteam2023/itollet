import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/common_widgets/element_ellipse.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/constants/profile_icons.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class PrivacyView extends HookConsumerWidget {
  const PrivacyView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final scaffoldKey = GlobalKey<ScaffoldState>();
    final verifyEmailController = useTextEditingController();
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
                          context.popRoute();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    forceMaterialTransparency: true,
                    surfaceTintColor: Colors.white,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.white,
                    iconTheme: const IconThemeData(color: Colors.white),
                    centerTitle: true,
                    title: AutoSizeText(
                      textScaleFactor: textScaleFactor,
                      'GİZLİLİK',
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
            Padding(
              padding: EdgeInsets.only(top: 31.h),
              child: Center(
                child: Column(
                  children: [
                    walletCard(
                      context,
                      scaffoldKey,
                      verifyEmailController,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding walletCard(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
      TextEditingController? textEditingController) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.w),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          ElementEllipse(
            title: 'HESABIMI SİL',
            iconUrl: PrivacyIcons.delete,
            colors: const [Color(0xffFF553D), Color(0xffFF864B)],
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title:  AutoSizeText("Emin Misiniz?",
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  ),
                  content: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      helperText:
                          "Hesabınızı silmeyi onaylıyorsanız e-posta adresinizi yazınız",
                      helperMaxLines: 99,
                      hintText: FirebaseAuth.instance.currentUser?.email ??
                          "Hata Oluştu Daha Sonra Tekrar Deneyin",
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child:  AutoSizeText("İptal",
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (textEditingController?.text ==
                            FirebaseAuth.instance.currentUser?.uid) {
                          //Silme fonsksiyonu
                        }
                      },
                      child:  AutoSizeText("Hesabımı Sil",
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ElementEllipse(
            title: 'GİZLİLİK POLİTİKASI',
            iconUrl: PrivacyIcons.privacy,
            colors: const [Color(0xff5CC65D), Color(0xff2CA882)],
            onTap: () {
              context.pushRoute(const PrivacyPolicyRoute());
            },
          ),
          if (false)
            ElementEllipse(
              title: 'KULLANICI SÖZLEŞMESİ',
              iconUrl: PrivacyIcons.user,
              colors: const [Color(0xff0046A5), Color(0xff50D7E0)],
              onTap: () {},
            ),
        ],
      ),
    );
  }
}
