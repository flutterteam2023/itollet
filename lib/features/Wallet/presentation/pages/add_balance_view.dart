// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/features/Wallet/presentation/pages/get_iframe.dart';

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
                      String? phoneNumber;
                      String? address;

                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Ödeme Aşaması İçin gerekli Bilgiler"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    phoneNumber = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Telefon Numarası",
                                  ),
                                ),
                                const Gap(18),
                                TextField(
                                  onChanged: (value) {
                                    address = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Adres",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("tamam"),
                              ),
                            ],
                          );
                        },
                      );
                      if (phoneNumber != null || address != null) {
                        await getIframe(context, 50, phoneNumber!, address!);
                      }
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
                      String? phoneNumber;
                      String? address;

                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Ödeme Aşaması İçin gerekli Bilgiler"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    phoneNumber = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Telefon Numarası",
                                  ),
                                ),
                                const Gap(18),
                                TextField(
                                  onChanged: (value) {
                                    address = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Adres",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("tamam"),
                              ),
                            ],
                          );
                        },
                      );
                      if (phoneNumber != null || address != null) {
                        await getIframe(context, 100, phoneNumber!, address!);
                      }
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
                      String? phoneNumber;
                      String? address;

                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Ödeme Aşaması İçin gerekli Bilgiler"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    phoneNumber = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Telefon Numarası",
                                  ),
                                ),
                                const Gap(18),
                                TextField(
                                  onChanged: (value) {
                                    address = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "Adres",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("tamam"),
                              ),
                            ],
                          );
                        },
                      );
                      if (phoneNumber != null || address != null) {
                        await getIframe(context, 200, phoneNumber!, address!);
                      }
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
