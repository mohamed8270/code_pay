import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsPageWebview extends StatefulWidget {
  final String weburl;
  const NewsPageWebview({super.key, required this.weburl});

  @override
  State<NewsPageWebview> createState() => _NewsPageWebviewState();
}

class _NewsPageWebviewState extends State<NewsPageWebview> {
  var icn = ReusableClass();

  var loading = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loading = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loading = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loading = 100;
            });
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.weburl));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: controller),
        if (loading < 100)
          Center(
            child: SizedBox(
              height: 18,
              width: 18,
            ),
          ),
      ],
    );
  }
}
