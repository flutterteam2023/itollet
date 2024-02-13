import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:itollet/features/Account/Services/account_transaction_service.dart';
import 'package:itollet/features/Account/Utils/account_transaction_type_enum.dart';
import 'package:intl/intl.dart';

@RoutePage()
class BalanceActivitiesView extends StatelessWidget {
  const BalanceActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final dateformat = DateFormat('dd MMMM yyyy HH:mm');
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title:  AutoSizeText("Hesap Hareketleri",
        textScaleFactor: textScaleFactor,
        ),
      ),
      body: FutureBuilder(
          future: AccountTransactionService().getSnapshot,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.none ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              print(snapshot.data?.docs.length);
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    snapshot.data?.docs.length ?? 0,
                    (index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: ListTile(
                            title: AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              snapshot.data?.docs[index].data().type.toTitle ??
                                  "null",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            subtitle: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  textScaleFactor:textScaleFactor,
                                  dateformat.format(
                                  snapshot.data?.docs[index].data().createdAt ??
                                      DateTime.now(),
                                )),
                                AutoSizeText(
                                  textScaleFactor:textScaleFactor,
                                  snapshot.data?.docs[index].data().docId ??
                                      "null",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: Colors.green[700],
                                        decoration: TextDecoration.underline,
                                      ),
                                )
                              ],
                            ),
                            trailing: AutoSizeText(
                              textScaleFactor:textScaleFactor,
                              snapshot.data?.docs[index].data().amount ??
                                  "null",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
