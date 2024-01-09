import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:itollet/features/Payment/Views/webview_view.dart';

@RoutePage()
class IFrameScreenView extends StatelessWidget {
  const IFrameScreenView({super.key, required this.htmlString});
  final String htmlString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(htmlString),
    );
  }
}
