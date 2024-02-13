import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/iberkeugur/Log/log.dart';
import 'package:itollet/iberkeugur/Snackbar/snackbar_extension.dart';
import 'package:itollet/iberkeugur/Space/spaces.dart';

@RoutePage()
class UserNameChangeView extends HookConsumerWidget {
  const UserNameChangeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final userNameController = useTextEditingController(text: homeState.user.userName);
    final isLoading = useValueNotifier<bool>(false);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title:  AutoSizeText("Kullanıcı Adımı Değiştir",
        textScaleFactor: textScaleFactor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: StatefulBuilder(builder: (context, setChangeState) {
          return Column(
            children: [
              TextField(
                controller: userNameController,
                onChanged: (value) {
                  setChangeState(() {});
                },
                decoration:  InputDecoration(
                  label: AutoSizeText("Kullanıcı adı",
                  textScaleFactor: textScaleFactor,
                  ),
                ),
              ),
              Spaces.L.height,
              Bounceable(
                onTap: userNameController.text == homeState.user.userName
                    ? null
                    : () async {
                        isLoading.value = true;
                        if (userNameController.text != homeState.user.userName) {
                          if (userNameController.text.isNotEmpty && userNameController.text.length > 5) {
                            await ref.watch(homeProvider.notifier).changeUserName(userNameController.text).then((value) async {
                              if (value) {
                                Log.instance.success("Kullanıcı adınız ${userNameController.text} olarak değiştirildi");
                                context.snackbar("Kullanıcı adınız ${userNameController.text} olarak değiştirildi");
                                await ref.watch(homeProvider.notifier).getUser();
                              } else {
                                Log.instance.success("Beklenmeyen bir hata oluştu.");
                                context.snackbar("Beklenmeyen bir hata oluştu.");
                              }
                            });
                          } else if (userNameController.text.length <= 5) {
                            Log.instance.error("Kullanıcı adı 5 karakterden kısa olamaz.");
                            context.snackbar("Kullanıcı adı 5 karakterden kısa olamaz");
                          } else {
                            Log.instance.error("Kullanıcı adı boş bırakılamaz");
                            context.snackbar("Kullanıcı adını boş bırakılamaz.");
                          }
                        } else {
                          Log.instance.error("Kullanıcı adınızı değiştirmediniz.");
                          context.snackbar("Kullanıcı adınızı değiştirmediniz.");
                        }
                        isLoading.value = false;
                      },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(113.r),
                    color: userNameController.text == homeState.user.userName ? secondary.withOpacity(.25) : secondary,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    child: Center(
                      child: ValueListenableBuilder(
                          valueListenable: isLoading,
                          builder: (context, _, __) {
                            if (_) {
                              return SizedBox(
                                height: 25.h,
                                width: 25.h,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            } else {
                              return SizedBox(
                                height: 25.h,
                                child: AutoSizeText(
                                  textScaleFactor: textScaleFactor,
                                  'DEĞİŞTİR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),

                                )
                              );
                            }
                          }),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
