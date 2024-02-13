import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title:  AutoSizeText("Profili Düzenle",
        textScaleFactor: textScaleFactor,
        ),
      ),
      body: Column(
        children: [
          Bounceable(
            onTap: () {
              context.pushRoute(const ProfilePhotoChangeRoute());
            },
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListTile(
                title: AutoSizeText("Profil Fotoğrafı", maxLines: 1,
                textScaleFactor: textScaleFactor,
                ),
                subtitle: AutoSizeText("Görünürlüğünü arttırmak için profil fotoğrafı eklemelisin",
                textScaleFactor: textScaleFactor,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
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
                title: AutoSizeText(homeState.user.userName ?? "Kullanıcı adı oluştur",
                textScaleFactor: textScaleFactor,
                ),
                subtitle:  AutoSizeText("Kullanıcı adını değiştirebilirsin.",
                textScaleFactor: textScaleFactor,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          const Divider(),
          Bounceable(
            onTap: () {
              context.pushRoute(const PasswordChangeRoute());
            },
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListTile(
                title: AutoSizeText("Şifremi Değiştir",
                textScaleFactor: textScaleFactor,
                ),
                subtitle: AutoSizeText("Hesabının güvenliğini sağla",
                textScaleFactor: textScaleFactor,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
