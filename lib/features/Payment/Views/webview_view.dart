import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Payment/providers/payment_notifier.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

const String kNavigationExamplePage = '''
<!doctype html>
<html lang="en">
<head>
    <title>iyzico Mock 3D-Secure Processing Page</title>
</head>
<body>
<form id="iyzico-3ds-form" action="https://sandbox-api.iyzipay.com/payment/mock/init3ds" method="post">
    <input type="hidden" name="orderId" value="mock134-8306912745822849iyziord">
    <input type="hidden" name="bin" value="460345">
    <input type="hidden" name="successUrl" value="https://sandbox-api.iyzipay.com/payment/iyzipos/callback3ds/success/5">
    <input type="hidden" name="failureUrl" value="https://sandbox-api.iyzipay.com/payment/iyzipos/callback3ds/failure/5">
    <input type="hidden" name="confirmationUrl" value="https://sandbox-api.iyzipay.com/payment/mock/confirm3ds">
    <input type="hidden" name="PaReq" value="c6fae241-bf02-4bf2-88a3-a4b2836acbdb">
</form>
<script type="text/javascript">
    document.getElementById("iyzico-3ds-form").submit();
</script>
</body>
</html>
''';

@RoutePage()
class WebView extends ConsumerStatefulWidget {
  final String html;
  const WebView(this.html, {super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WebViewState();
}
class _WebViewState extends ConsumerState<WebView> {
  Future<void> setcontroller(WebViewController controller) async {
    controller.loadRequest(
      Uri.parse('data:text/html;base64,${base64Encode(
        const Utf8Encoder().convert(widget.html),
      )}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(paymentProvider);
    WebViewController? controller;
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    controller = WebViewController.fromPlatformCreationParams(params);
// ···
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: setcontroller(controller),
          builder: (context, snapshot) {
            return WebViewWidget(controller: controller!);
          }),
    );
  }
}
