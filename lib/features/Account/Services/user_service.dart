import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  final user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance.collection("users");

  ///i -5 veaya +2.5 olabilir.
  Future<void> updateAllTimeBalance(double i) async {
    await db.doc(user?.uid).update({
      "all_time_balance": FieldValue.increment(i),
    });
  }

  ///i -5 veaya +2.5 olabilir.
  Future<void> updateTotalBiddingFee(double i) async {
    await db.doc(user?.uid).update({
      "total_bidding_fee": FieldValue.increment(i),
    });
  }

  ///i -5 veaya +2.5 olabilir.
  Future<void> updateTotalExtensionFee(double i) async {
    await db.doc(user?.uid).update({
      "total_extension_fee": FieldValue.increment(i),
    });
  }
}
