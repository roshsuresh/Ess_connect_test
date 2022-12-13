import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FeeDemo extends StatefulWidget {
  const FeeDemo({Key? key}) : super(key: key);

  @override
  State<FeeDemo> createState() => _FeeDemoState();
}

class _FeeDemoState extends State<FeeDemo> {
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://api.esstestonline.in/curriculam',
    );
  }
}
