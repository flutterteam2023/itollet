import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Payment/Models/payment_card_model.dart';

import 'package:itollet/features/Payment/states/payment_state.dart';

final paymentProvider =
    NotifierProvider.autoDispose<PaymentNotifier, PaymentState>(
        PaymentNotifier.new);

class PaymentNotifier extends AutoDisposeNotifier<PaymentState> {
  final _auth = FirebaseAuth.instance;

  @override
  PaymentState build() {
    return PaymentState.initial();
  }

  Future<void> payment(PaymentCardModel paymentCardModel) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({
      "cardHolderName": paymentCardModel.cardHolderName,
      "cardNumber":paymentCardModel.cardNumber,
      "expireMonth":paymentCardModel.expireMonth,
      "expireYear": paymentCardModel.expireYear,
      "cvc": paymentCardModel.cvc,
      "registerCard": paymentCardModel.registerCard
    });
    var dio = Dio();
    var response = await dio.request(
      'https://tame-lime-bison-tam.cyclic.cloud/api/iyzico/pay',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print('datalarımız:' + json.encode(response.data).toString());
    } else {
      print(response.statusMessage);
    }
  }
}
