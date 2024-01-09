import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:itollet/features/Account/Services/user_service.dart';
import 'package:itollet/features/Wallet/presentation/get_user_ip_address.dart';

import 'package:http/http.dart' as http;
import 'package:itollet/features/Wallet/presentation/pages/iframe_converter.dart';
import 'package:itollet/routing/app_router.dart';

Future<void> getIframe(BuildContext context, int productPrice) async {
  final ipAddress = await getUserIPAddress();

  var headers = {'Content-Type': 'application/x-www-form-urlencoded', 'Accept': 'application/json'};
  var request = http.Request('POST', Uri.parse('https://seahorse-app-h2u2p.ondigitalocean.app/payment'));

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
  request.bodyFields = {
    'user_name': UserService().user?.displayName ?? "impossible",
    'user_address': "dijital ürün",
    'user_phone': UserService().user?.phoneNumber ?? "5372505893",
    'user_ip': ipAddress ?? "impossible",
    'email': UserService().user?.email ?? "impossible",
    'payment_amount': "${productPrice * 100}",
    'basket': """["Örnek Ürün 1", "18.00", 1]""",
    'lang': 'tr'
  };
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final s = await response.stream.bytesToString();
    print(s);
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
  }
}
