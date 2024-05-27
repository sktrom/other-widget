import 'package:flutter/material.dart';
import 'package:other_widget/my_web_view_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WepViewPage extends StatefulWidget {
  const WepViewPage({super.key});

  @override
  State<WepViewPage> createState() => _WepViewPageState();
}

class _WepViewPageState extends State<WepViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://google.com'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اياز للسكس والدعارة'),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  final message = ScaffoldMessenger.of(context);
                  if (await controller.canGoBack()) {
                    await controller.goBack();
                  } else {
                    message.showSnackBar(
                      const SnackBar(
                        content: Text('No Back History Found'),
                      ),
                    );
                    return;
                  }
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              IconButton(
                onPressed: () async {
                  final message = ScaffoldMessenger.of(context);
                  if (await controller.canGoForward()) {
                    await controller.goForward();
                  } else {
                    message.showSnackBar(
                      const SnackBar(
                        content: Text('No Forward History Found'),
                      ),
                    );
                    return;
                  }
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
              IconButton(
                onPressed: () {
                  controller.reload();
                  final message = ScaffoldMessenger.of(context);
                  message.showSnackBar(
                    const SnackBar(
                      content: Text('Success Reload'),
                    ),
                  );
                },
                icon: const Icon(Icons.replay),
              ),
            ],
          ),
        ],
      ),
      body: MyWebViewWidget(
        controller: controller,
      ),
    );
  }
}
