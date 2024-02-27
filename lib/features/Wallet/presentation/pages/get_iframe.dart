import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itollet/features/Account/Services/user_service.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Wallet/presentation/get_user_ip_address.dart';

import 'package:http/http.dart' as http;
import 'package:itollet/features/Wallet/presentation/pages/iframe_converter.dart';
import 'package:itollet/iberkeugur/Log/log.dart';
import 'package:itollet/routing/app_router.dart';

Future<void> getIframe(BuildContext context, int productPrice, String phoneNumber, String address) async {
  await EasyLoading.show(status: "yükleniyor...");
  try {
    final ipAddress = await getUserIPAddress();
    var headers = {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://orca-app-4sfso.ondigitalocean.app/payment'));

    /* request.bodyFields = {
                        'user_name': 'berke ugur',
                        'user_address': 'digital ürün',
                        'user_phone': '5350749367',
                        'user_ip': '205.40.150.173',
                        'email': 'berkeugur67@gmail.com',
                        'payment_amount': '100',
                        'basket': '[\'Örnek Ürün 1\', \'100.00\', 1]',
                        'lang': 'tr'
                      }; */

    Log.instance.error(UserService().user);
    final userResponse = await FirebaseFirestore.instance.collection("users").doc(UserService().user?.uid).get();
    final user = userResponse.data();
    UserModel userModel = UserModel.fromJson(user as Map<String, dynamic>);
    request.bodyFields = {
      'user_name': userModel.userName ?? "null",
      'user_address': address,
      'user_phone': phoneNumber,
      'user_ip': ipAddress.toString(),
      'email': UserService().user!.email!,
      'payment_amount': (productPrice * 100).toString(),
      'basket':
          '[\n    ["Bakiye ${(productPrice * 100).toString()} Paketi", "${(productPrice * 100).toString()}", 1]\n]',
      'lang': 'tr'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final s = await response.stream.bytesToString();
      print(s);
      await EasyLoading.dismiss();
      context.pushRoute(
        IFrameScreenRoute(
          htmlString: iframeConverter(
            defaultIFrameValue: s,
          ),
        ),
      );
    } else {
      print(response.reasonPhrase);
      print(response.stream);
      print(await response.stream.bytesToString());
      await EasyLoading.dismiss();
      await EasyLoading.showToast(await response.stream.bytesToString());
    }
  } catch (e) {
    await EasyLoading.dismiss();
  }
}
