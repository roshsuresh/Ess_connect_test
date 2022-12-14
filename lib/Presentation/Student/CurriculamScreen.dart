import 'package:Ess_test/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CurriculamPage extends StatelessWidget {
  CurriculamPage({Key? key, required this.token}) : super(key: key);
  String token;

  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: UIGuide.light_Purple,
        ),
        body: Center(
          child: WebView(
            initialUrl:
                'https://curriculumtestonline.in/login-via-token?token=$token',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
          ),
        ),
      ),
    );
  }
}
