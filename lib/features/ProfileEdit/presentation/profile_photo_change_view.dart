import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProfilePhotoChangeView extends HookConsumerWidget {
  const ProfilePhotoChangeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Fotoğrafını Değiştir"),
      ),
      body: Column(
        children: [
          Text("profil fotoğrafı"),
        ],
      ),
    );
  }
}
