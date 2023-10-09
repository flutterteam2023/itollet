import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:itollet/routing/app_router.dart';

@RoutePage()
class BalanceView extends StatelessWidget {
  const BalanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap özeti"),
        centerTitle: true,
        actions: [
          FilledButton(
            onPressed: () {
              context.pushRoute(const AddBalanceRoute());
            },
            child: const Text("Para Ekle"),
          ),
          const SizedBox(width: 18),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              child: ListTile(
                title: const Text("Güncel Bakite"),
                trailing: Text(
                  "+35,34 ₺",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              child: ListTile(
                title: const Text("Toplam Ödemeler"),
                trailing: Text(
                  "+440 ₺",
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
                    title: const Text("Toplam Harcamalar"),
                    trailing: Text(
                      "-404,66 ₺",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.arrow_forward),
                    title: Text(
                      "Teklif Verme Ücretleri",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    trailing: Text(
                      "-380,44 ₺",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.arrow_forward),
                    title: Text(
                      "İlan Öne Çıkartma Ücreti",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    trailing: Text(
                      "-24,22 ₺",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
