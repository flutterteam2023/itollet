import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class ProfileEditView extends HookConsumerWidget {
  const ProfileEditView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profili Düzenle"),
      ),
      body: Column(
        children: [
          Bounceable(
            onTap: () {
              context.pushRoute(const ProfilePhotoChangeRoute());
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: ListTile(
                title: Text("Profil Fotoğrafı"),
                subtitle: Text("Görünürlüğünü arttırmak için profil fotoğrafı eklemelisin"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          const Divider(),
          Bounceable(
            onTap: () {
              context.pushRoute(const UserNameChangeRoute());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListTile(
                title: Text(homeState.user.userName ?? "Kullanıcı adı oluştur"),
                subtitle: const Text("Kullanıcı adını değiştirebilirsin."),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          const Divider(),
          Bounceable(
            onTap: () {
              context.pushRoute(const PasswordChangeRoute());
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: ListTile(
                title: Text("Şifremi Değiştir"),
                subtitle: Text("Hesabının güvenliğini sağla"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
