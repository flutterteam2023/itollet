import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PostProccessView extends ConsumerWidget {
  const PostProccessView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İLAN SÜREÇLERİ"),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Kaç tane ilan paylaşabilirim?"),
                ),
                if (true) Text("yanıt")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
