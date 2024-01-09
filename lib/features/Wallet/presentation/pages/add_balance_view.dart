// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Account/Services/user_service.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/features/Payment/Views/webview_view.dart';
import 'package:http/http.dart' as http;
import 'package:itollet/features/Wallet/presentation/get_user_ip_address.dart';
import 'package:itollet/features/Wallet/presentation/pages/get_iframe.dart';
import 'package:itollet/features/Wallet/presentation/pages/iframe_converter.dart';
import 'package:itollet/features/Wallet/presentation/pages/iframe_screen_view.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class AddBalanceView extends ConsumerWidget {
  const AddBalanceView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bakiye Yükle"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "YÜKLENECEK MİKTARI SEÇİNİZ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 18,
                runSpacing: 18,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Bounceable(
                    onTap: () async {
                      await getIframe(context, 50);
                    },
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.purple.withOpacity(.6),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "50₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              "Yükle",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () async {
                      await getIframe(context, 100);
                    },
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.purple.withOpacity(.8),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "100₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              "Yükle",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () async {
                      await getIframe(context, 200);
                    },
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.purple.withOpacity(1),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "200₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              "Yükle",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
