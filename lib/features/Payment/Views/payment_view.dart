import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Payment/Models/payment_card_model.dart';
import 'package:itollet/features/Payment/providers/payment_notifier.dart';

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
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: 
         AutoSizeText("Ödeme Bilgileri",
         
          textScaleFactor: textScaleFactor,),
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
              child:  AutoSizeText(
                textScaleFactor: textScaleFactor,
                'Validate',
                style: const TextStyle(
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
      ref.read(paymentProvider.notifier).payment(paymentCardModel, context);

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
