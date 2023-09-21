// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/constants/constant_colors.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/iberkeugur/Log/log.dart';
import 'package:itollet/iberkeugur/Snackbar/snackbar_extension.dart';

@RoutePage()
class PasswordChangeView extends HookConsumerWidget {
  const PasswordChangeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final oldPasswordController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordVerifyController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Şifremi Değiştir"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: StatefulBuilder(builder: (context, setColumnState) {
          return Column(
            children: [
              const SizedBox(height: 18),
              TextField(
                controller: oldPasswordController,
                onChanged: (value) {
                  setColumnState(() {});
                },
                decoration: const InputDecoration(
                  label: Text("Eski şifre"),
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  setColumnState(() {});
                },
                decoration: const InputDecoration(
                  label: Text("Yeni şifre"),
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: passwordVerifyController,
                onChanged: (value) {
                  setColumnState(() {});
                },
                decoration: const InputDecoration(
                  label: Text("Yeni şifre tekrar"),
                ),
              ),
              const SizedBox(height: 18),
              Bounceable(
                onTap: () async {
                  if (oldPasswordController.text.isNotEmpty && passwordController.text.isNotEmpty && passwordVerifyController.text.isNotEmpty) {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(email: homeState.user.email!, password: oldPasswordController.text);
                      if (passwordController.text == passwordVerifyController.text &&
                          passwordVerifyController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        await FirebaseAuth.instance.currentUser?.updatePassword(passwordController.text).then((value) {
                          context.snackbar("Şifreniz başarıyla yenilendi");
                        }).onError((error, stackTrace) {
                          context.snackbar("Beklenmeyen bir hata oluştu $error");
                        });
                        Log.instance.success("Şifre Başarıyla Değiştirildi");
                      } else {
                        Log.instance.error("Yeni şifreler birbiriyle aynı değil");
                        context.snackbar("Yeni şifreler birbiriyle aynı değil");
                      }
                    } catch (e) {
                      if (e.toString() == "[firebase_auth/weak-password] Password should be at least 6 characters") {
                        Log.instance.error("Yeni şifreniz en az 6 karakter olmalıdır.");
                        context.snackbar("Yeni şifreniz en az 6 karakter olmalıdır.");
                      } else {
                        Log.instance.error("MEVCUT ŞİFRE DOĞRU DEĞİL $e");
                        context.snackbar("MEVCUT ŞİFRE DOĞRU DEĞİL $e");
                      }
                    }
                  } else {
                    Log.instance.error("Boşlukları doldurun");
                    context.snackbar("Boşlukları doldurun");
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(113.r),
                    color: oldPasswordController.text.isNotEmpty && passwordController.text.isNotEmpty && passwordVerifyController.text.isNotEmpty
                        ? secondary
                        : secondary.withOpacity(.25),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    child: Center(
                      child: Text(
                        'DEĞİŞTİR',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
