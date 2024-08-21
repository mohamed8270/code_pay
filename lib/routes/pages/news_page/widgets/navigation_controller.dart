import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControlls extends StatelessWidget {
  const NavigationControlls({super.key, required this.controller});

  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    var use = ReusableClass();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            if (await controller.canGoBack()) {
              await controller.goBack();
            }
          },
          child: use.svgIcon(StaticData.arrowBack, 24.0, 24.0, cBlack),
        ),
        StaticData.gap4,
        GestureDetector(
          onTap: () async {
            if (await controller.canGoForward()) {
              await controller.goForward();
            }
          },
          child: use.svgIcon(StaticData.arrowGo, 24.0, 24.0, cBlack),
        ),
        StaticData.gap4,
        GestureDetector(
          onTap: () => controller.reload(),
          child: use.svgIcon(StaticData.reload, 22.0, 22.0, cBlack),
        ),
        StaticData.gap4,
      ],
    );
  }
}
