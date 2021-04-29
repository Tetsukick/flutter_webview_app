import 'dart:async';

import 'package:flutter_webview_app/navigation_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewTest extends StatefulWidget {
  final String url;

  WebViewTest(this.url);

  @override
  State<StatefulWidget> createState() {
    return _WebViewTestState();
  }
}

class _WebViewTestState extends State<WebViewTest> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [NavigationControls(_controller.future)],),
      body: WebView(
        initialUrl: this.widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
          //_loadHtmlFromAssets();
        },
      ),
    );
  }
}