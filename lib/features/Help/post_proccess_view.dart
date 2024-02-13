import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PostProccessView extends ConsumerWidget {
  const PostProccessView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title:  AutoSizeText("İLAN SÜREÇLERİ",
        textScaleFactor: textScaleFactor,
        ),
      ),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: AutoSizeText("Kaç tane ilan paylaşabilirim?",
                  
                  textScaleFactor: textScaleFactor,
                  ),
                ),
                if (true) AutoSizeText("yanıt",
                textScaleFactor: textScaleFactor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
