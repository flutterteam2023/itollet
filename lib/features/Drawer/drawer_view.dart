import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/routing/app_router.dart';
import 'package:random_avatar/random_avatar.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final homeState = ref.watch(homeProvider);
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
                StreamBuilder<UserModel>(
                    stream: ref.watch(homeProvider.notifier).getStreamUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print('Data gelmedi');
                      }
                      if (snapshot.hasData) {
                        if (snapshot.data?.photoUrl != null) {
                          return CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 48,
                            backgroundImage:
                                NetworkImage(snapshot.data!.photoUrl!),
                          );
                        } else {
                          return CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 48,
                            child: RandomAvatar(
                                FirebaseAuth.instance.currentUser?.uid ??
                                    "random",
                                trBackground: true,
                                height: 50,
                                width: 50),
                          );
                        }
                      }
                      return const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 48,
                        child: CircularProgressIndicator(
                          color: secondary,
                        ),
                      );
                    }),
                const SizedBox(height: 9),
                AutoSizeText(
                  textScaleFactor: textScaleFactor,
                 homeState.user.userName! ,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Rubik',
                  ),
                
                )
              ],
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              context.pushRoute(const MyAdsRoute());
            },
            title: AutoSizeText(
              textScaleFactor: textScaleFactor,
              "İLANLARIM",
              style: _buildTextStyle(),
            
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              context.pushRoute(const WalletRoute());
            },
            title: AutoSizeText(
              textScaleFactor: textScaleFactor,
              "CÜZDANIM",
              style: _buildTextStyle(),
            
            
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              context.pushRoute(const PrivacyRoute());
            },
            title:AutoSizeText(
              textScaleFactor: textScaleFactor,
              "GİZLİLİK",
              style: _buildTextStyle(),
            
            
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              context.pushRoute(const HelpRoute());
            },
            title: AutoSizeText(
              textScaleFactor: textScaleFactor,
              "YARDIM",
              style: _buildTextStyle(),
            
            
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                scaffoldKey.currentState?.closeDrawer();
                Future.delayed(const Duration(milliseconds: 500), () {
                  context.replaceRoute(const SplashRoute());
                });
              });
            },
            title: AutoSizeText(
              textScaleFactor: textScaleFactor,
              "OTURUMU SONLANDIR",
              style: _buildTextStyle(),
            
            
            
            ),
            trailing: const Icon(
              Icons.logout,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: 'Rubik',
    );
  }
}
