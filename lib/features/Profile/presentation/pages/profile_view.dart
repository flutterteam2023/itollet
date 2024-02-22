import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/common_widgets/custom_appbar.dart';
import 'package:itollet/common_widgets/custom_filled_button.dart';
import 'package:itollet/common_widgets/element_ellipse.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/constants/profile_icons.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Auth/Login/presentation/providers/login_notifier.dart';
import 'package:itollet/features/Drawer/drawer_view.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/routing/app_router.dart';
import 'package:random_avatar/random_avatar.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 31.h),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder<UserModel>(
                      stream: ref.watch(homeProvider.notifier).getStreamUser(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print('Data gelmedi');
                        }

                        if (snapshot.hasData) {
                          if (snapshot.data?.photoUrl != null) {
                            return Container(
                              height: 128.w,
                              width: 128.w,
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: primary.withOpacity(1),
                                image: DecorationImage(
                                  image: NetworkImage(snapshot.data!.photoUrl!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          } else {
                            return Container(
                                height: 128.w,
                                width: 128.w,
                                padding: const EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: primary.withOpacity(1),
                                ),
                                child: RandomAvatar(FirebaseAuth.instance.currentUser?.uid ?? "random",
                                    trBackground: true, height: 50, width: 50));
                          }
                        }
                        return Container(
                          height: 128.w,
                          width: 128.w,
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: secondary,
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 18.sp,
                  ),
                  AutoSizeText(
                    textScaleFactor: textScaleFactor,
                    homeState.user.userName!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                  AutoSizeText(
                    textScaleFactor: textScaleFactor,
                    homeState.user.email!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: black02,
                    ),
                  ),
                  const SizedBox(height: 9),
                  SizedBox(
                    width: 180.w,
                    child: CustomFilledButton(
                      padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                      radius: 18.r,
                      text: "PROFİLİ DÜZENLE",
                      onTap: () {
                        context.pushRoute(const ProfileEditRoute());
                      },
                    ),
                  ),
                  profileCard(context, scaffoldKey, ref),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding profileCard(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.w),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          ElementEllipse(
            title: 'ANASAYFA',
            iconUrl: ProfileIcons.privacy,
            colors: const [Color(0xffFF553D), Color(0xffFF864B)],
            onTap: () {
              context.pushRoute(const HomeRoute());
            },
          ),
          ElementEllipse(
            title: 'İLANLARIM',
            iconUrl: ProfileIcons.myPosts,
            colors: const [Color(0xffFF553D), Color(0xffFF864B)],
            onTap: () {
              context.pushRoute(const MyAdsRoute());
            },
          ),
          ElementEllipse(
            title: 'CÜZDANIM',
            iconUrl: ProfileIcons.wallet,
            colors: const [Color(0xff5CC65D), Color(0xff2CA882)],
            onTap: () {
              context.pushRoute(const WalletRoute());
            },
          ),
          ElementEllipse(
            title: 'GİZLİLİK',
            iconUrl: ProfileIcons.privacy,
            colors: const [Color(0xff0046A5), Color(0xff50D7E0)],
            onTap: () {
              context.pushRoute(const PrivacyRoute());
            },
          ),
          if (false)
            // ignore: dead_code
            ElementEllipse(
              title: 'YARDIM',
              iconUrl: ProfileIcons.help,
              colors: const [Color(0xff834AFA), Color(0xffD14C88)],
              onTap: () {
                context.pushRoute(const HelpRoute());
              },
            ),
          ElementEllipse(
            title: 'HESABIMI SİL',
            iconUrl: ProfileIcons.logout,
            colors: const [Color(0xff0046A5), Color(0xff50D7E0)],
            onTap: () async {
              final textEditingController = TextEditingController();
              final passwordController = TextEditingController();
              final _formKey = GlobalKey<FormState>();
              final _formKey2 = GlobalKey<FormState>();

              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Emin Misiniz?"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Lütfen e-posta adresinizi giriniz";
                              }
                              if (value != FirebaseAuth.instance.currentUser?.email) {
                                return "E-posta adresiniz yanlış";
                              }
                              return null;
                            },
                            controller: textEditingController,
                            decoration: InputDecoration(
                              helperText: "Hesabınızı silmeyi onaylıyorsanız e-posta adresinizi yazınız",
                              helperMaxLines: 99,
                              hintText:
                                  FirebaseAuth.instance.currentUser?.email ?? "Hata Oluştu Daha Sonra Tekrar Deneyin",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Form(
                          key: _formKey2,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Lütfen şifrenizi giriniz";
                              }

                              return null;
                            },
                            controller: passwordController,
                            decoration: const InputDecoration(
                              helperText: "Hesabınızı silmeyi onaylıyorsanız şifrenizi yazınız",
                              helperMaxLines: 99,
                              hintText: 'Şifreniz' ?? "Hata Oluştu Daha Sonra Tekrar Deneyin",
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('İptal')),
                      TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate() && _formKey2.currentState!.validate()) {
                              if (textEditingController.text == FirebaseAuth.instance.currentUser?.email) {
                                ref
                                    .read(loginProvider.notifier)
                                    .deleteUser(context, textEditingController.text, passwordController.text);
                                //Silme fonsksiyonu
                              }
                            } else {}
                          },
                          child: const Text('Sil'))
                    ],
                  );
                },
              );
            },
          ),
          ElementEllipse(
            title: 'ÇIKIŞ YAP',
            iconUrl: ProfileIcons.logout,
            colors: const [Color(0xffFED552), Color(0xffFF8099)],
            onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                scaffoldKey.currentState?.closeDrawer();
                Future.delayed(const Duration(milliseconds: 500), () {
                  context.pushRoute(const LoginRoute());
                });
              });
            },
          )
        ],
      ),
    );
  }
}
