import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
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
          onPageFinished: (url) async {
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
        const ChoiceFilter(),
        if (loading < 100)
          Center(
            child: SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(
                value: loading / 100,
                valueColor: const AlwaysStoppedAnimation<Color>(cGreen),
                color: ccGrey,
                strokeAlign: 3,
                strokeWidth: 3,
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
      ],
    );
  }
}

class ChoiceFilter extends StatelessWidget {
  const ChoiceFilter({super.key});

  @override
  Widget build(BuildContext context) {
    var scrnsize = MediaQuery.sizeOf(context);
    var txt = TextFond();
    return GestureDetector(
      onTap: () {},
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          height: scrnsize.height * 0.045,
          decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: txt.textWidget(
                'Information Technology', 8.0, FontWeight.w600, cBlack),
          ),
        ),
      ),
    );
  }
}