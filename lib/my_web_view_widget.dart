import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViewWidget extends StatefulWidget {
  const MyWebViewWidget({super.key, required this.controller});
  final WebViewController controller;

  @override
  State<MyWebViewWidget> createState() => _MyWebViewWidgetState();
}

class _MyWebViewWidgetState extends State<MyWebViewWidget> {
  var loadingPage = 0;
  @override
  void initState() {
    super.initState();
    widget.controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPage = 100;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: widget.controller),
        if (loadingPage < 100)
          LinearProgressIndicator(
            value: loadingPage / 100,
          ),
      ],
    );
  }
}
