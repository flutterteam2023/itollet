// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title:  AutoSizeText("Bakiye Yükle",
        textScaleFactor: textScaleFactor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                textScaleFactor:textScaleFactor,
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
                            title:  AutoSizeText("Ödeme Aşaması İçin Gerekli Bilgiler",
                            textScaleFactor: textScaleFactor,
                            ),
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
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child:  AutoSizeText("Tamam",
                                textScaleFactor: textScaleFactor,
                                ),
                              
                              )
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
                            AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              "50₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            AutoSizeText(
                              textScaleFactor:textScaleFactor,
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
                            title:  AutoSizeText("Ödeme Aşaması İçin Gerekli Bilgiler",
                            textScaleFactor: textScaleFactor,
                            ),
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
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child:  AutoSizeText("Tamam",
                                textScaleFactor: textScaleFactor,
                                ),
                              
                              )
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
                            AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              "100₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            AutoSizeText(
                              textScaleFactor:textScaleFactor,
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
                            title:  AutoSizeText("Ödeme Aşaması İçin Gerekli Bilgiler",
                            textScaleFactor: textScaleFactor,
                            ),
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
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child:  AutoSizeText("Tamam",
                                textScaleFactor: textScaleFactor,
                                ),
                              
                              )
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
                            AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              "200₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            AutoSizeText(
                              textScaleFactor:textScaleFactor,
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
                            title:  AutoSizeText("Ödeme Aşaması İçin Gerekli Bilgiler",
                            textScaleFactor: textScaleFactor,
                            ),
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
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child:  AutoSizeText("Tamam",
                                
                                textScaleFactor: textScaleFactor,
                                ),
                              
                              )
                            ],
                          );
                        },
                      );
                      if (phoneNumber != null || address != null) {
                        await getIframe(context, 20, phoneNumber!, address!);
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
                            AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              "20₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            AutoSizeText(
                              textScaleFactor:textScaleFactor,
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
                            title:  AutoSizeText("Ödeme Aşaması İçin Gerekli Bilgiler",
                            textScaleFactor: textScaleFactor,
                            ),
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
                              ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child:  AutoSizeText("Tamam",
                                textScaleFactor: textScaleFactor,
                                ),
                              
                              )
                            ],
                          );
                        },
                      );
                      if (phoneNumber != null || address != null) {
                        await getIframe(context, 10, phoneNumber!, address!);
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
                            AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              "10₺",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            AutoSizeText(
                              textScaleFactor:textScaleFactor,
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
