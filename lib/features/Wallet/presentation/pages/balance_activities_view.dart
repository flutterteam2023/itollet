import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BalanceActivitiesView extends StatelessWidget {
  const BalanceActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap Hareketleri"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            10,
            (index) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: ListTile(
                    title: Text(
                      "Teklif Verme Ücreti",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("07 Ağustos 2023"),
                        Text(
                          "12C4z8cLnX6zdyQaheUn",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.green[700],
                                    decoration: TextDecoration.underline,
                                  ),
                        )
                      ],
                    ),
                    trailing: Text(
                      "-${300 - 13 * index} ₺",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
