import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itollet/features/Account/Models/account_transaction_model.dart';

class AccountTransactionService {
  final db = FirebaseFirestore.instance.collection("AccountTransactions");

  Future<void> create(AccountTransactionModel accountTransactionModel) async {
    final docRef = db.doc();
    await docRef.set(
      accountTransactionModel.copyWith(docId: docRef.id).toJson(),
    );
  }

  Future<QuerySnapshot<AccountTransactionModel>>? get getSnapshot {
    return db
        .where("fromUid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .orderBy("createdAt", descending: true)
        .withConverter<AccountTransactionModel>(
          fromFirestore: (snapshot, _) =>
              AccountTransactionModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .get();
  }
}
