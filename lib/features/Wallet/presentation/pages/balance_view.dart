import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Home/presentation/providers/home_notifier.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class BalanceView extends ConsumerWidget {
  const BalanceView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;


    return Scaffold(
      appBar: AppBar(
        title:  AutoSizeText("Hesap özeti",
        textScaleFactor: textScaleFactor,
        ),
        centerTitle: true,
        actions: [
          FilledButton(
            onPressed: () {
              context.pushRoute(const AddBalanceRoute());
            },
            child:  AutoSizeText("Para Ekle",
            textScaleFactor: textScaleFactor,
            ),
          ),
          const SizedBox(width: 18),
        ],
      ),
      body: StreamBuilder<UserModel>(
          stream: ref.watch(homeProvider.notifier).getStreamUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        title:  AutoSizeText("Güncel Bakite",
                        
                        textScaleFactor: textScaleFactor,
                        ),
                        trailing: AutoSizeText(
                          textScaleFactor:textScaleFactor,
                          "+${state.streamUser.balance ?? 0} ₺",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        title:  AutoSizeText("Toplam Ödemeler",
                        textScaleFactor: textScaleFactor,
                        ),
                        trailing: AutoSizeText(
                          textScaleFactor:textScaleFactor,
                          "+${state.streamUser.allTimeBalance ?? 0} ₺",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title:  AutoSizeText("Toplam Harcamalar",
                            textScaleFactor: textScaleFactor,
                            ),
                            trailing: AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              "-${(state.streamUser.totalBiddingFee ?? 0) + (state.streamUser.totalExtensionFee ?? 0)} ₺",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.arrow_forward),
                            title: AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              "Teklif Verme Ücretleri",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            trailing: AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              "-${(state.streamUser.totalBiddingFee ?? 0)} ₺",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.arrow_forward),
                            title: AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              "İlan Öne Çıkartma Ücreti",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            trailing: AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              "-${(state.streamUser.totalExtensionFee ?? 0)} ₺",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
          }),
    );
  }
}
