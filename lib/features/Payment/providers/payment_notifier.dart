import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/InAppPurchase/data/model/Response/response_model.dart';
import 'package:itollet/features/Payment/Models/payment_card_model.dart';

import 'package:itollet/features/Payment/states/payment_state.dart';
import 'package:itollet/routing/app_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

final paymentProvider =
    NotifierProvider.autoDispose<PaymentNotifier, PaymentState>(
        PaymentNotifier.new);

class PaymentNotifier extends AutoDisposeNotifier<PaymentState> {
  final _auth = FirebaseAuth.instance;

  @override
  PaymentState build() {
    return PaymentState.initial();
  }

  Future<void> payment(PaymentCardModel paymentCardModel,BuildContext context) async {
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
   
    state = state.copyWith(responseModel: ResponseModel.fromJson(response.data["data"]) );

    if (state.responseModel.status=="success") {
      // print('datalarımız:' + json.encode(response.data["data"]["threeDSHtmlContent"]));
       String base64Data = base64Encode(utf8.encode(json.encode(state.responseModel.threeDSHtmlContent)));
           String decodedString = utf8.decode(base64.decode(state.responseModel.threeDSHtmlContent!));

       print(decodedString);
       state = state.copyWith(html: decodedString);
       // ignore: use_build_context_synchronously
       context.pushRoute(WebRoute(html: state.html!));

      
    } else {
      print(response.statusMessage);
      
    }
  }
   
}
