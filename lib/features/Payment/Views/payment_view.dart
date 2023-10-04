import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Payment/Models/payment_card_model.dart';
import 'package:itollet/features/Payment/providers/payment_notifier.dart';
import 'package:itollet/routing/app_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class PaymentView extends ConsumerStatefulWidget {
  const PaymentView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentViewState();
}

class _PaymentViewState extends ConsumerState<PaymentView> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ödeme Bilgileri"),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            labelCardHolder: cardHolderName,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (creditCardBrand) {
              //true when you want to show cvv(back) view
            },
          ),
          CreditCardForm(
            formKey: formKey,
            obscureCvv: true,
            obscureNumber: false,
            cardNumber: cardNumber,
            cvvCode: cvvCode,
            isHolderNameVisible: true,
            isCardNumberVisible: true,
            isExpiryDateVisible: true,
            cardHolderName: cardHolderName,
            expiryDate: expiryDate,
            themeColor: Colors.blue,
            cardNumberDecoration: InputDecoration(
              labelText: 'Number',
              hintText: 'XXXX XXXX XXXX XXXX',
              focusedBorder: border,
              enabledBorder: border,
            ),
            expiryDateDecoration: InputDecoration(
              focusedBorder: border,
              enabledBorder: border,
              labelText: 'Expired Date',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: InputDecoration(
              focusedBorder: border,
              enabledBorder: border,
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: InputDecoration(
              focusedBorder: border,
              enabledBorder: border,
              labelText: 'Card Holder',
            ),
            onCreditCardModelChange: onCreditCardModelChange,
          ),
          GestureDetector(
            onTap: _onValidate,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Validate',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'halter',
                  fontSize: 14,
                  package: 'flutter_credit_card',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      final paymentCardModel = PaymentCardModel(
        cardHolderName: cardHolderName,
        cardNumber: cardNumber.replaceAll(" ", ""),
        expireMonth: expiryDate.split("/").first,
        expireYear: expiryDate.split("/").last,
        cvc: cvvCode,
        registerCard: "0",
      );
      ref.read(paymentProvider.notifier).payment(paymentCardModel,context);
      
      print(paymentCardModel);
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

 
}
