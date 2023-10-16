import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itollet/features/Account/Models/account_transaction_model.dart';
import 'package:itollet/features/Account/Services/account_transaction_service.dart';
import 'package:itollet/features/Account/Utils/account_transaction_type_enum.dart';
import 'package:intl/intl.dart';

@RoutePage()
class BalanceActivitiesView extends StatelessWidget {
  const BalanceActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final dateformat = DateFormat('dd MMMM yyyy HH:mm');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesap Hareketleri"),
      ),
      body: FutureBuilder(
          future: AccountTransactionService().getSnapshot,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.none ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
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
                            title: Text(
                              snapshot.data?.docs[index].data().type.toTitle ??
                                  "null",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            subtitle: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(dateformat.format(
                                  snapshot.data?.docs[index].data().createdAt ??
                                      DateTime.now(),
                                )),
                                Text(
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
                            trailing: Text(
                              snapshot.data?.docs[index].data().amount ??
                                  "null",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        Divider(),
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
