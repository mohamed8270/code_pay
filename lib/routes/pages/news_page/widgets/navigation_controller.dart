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
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: use.svgIcon(StaticData.arrowBack, 22.0, 22.0, cBlack),
          ),
        ),
        StaticData.gap2,
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: use.svgIcon(StaticData.arrowGo, 22.0, 22.0, cBlack),
          ),
        ),
        StaticData.gap2,
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: use.svgIcon(StaticData.reload, 20.0, 20.0, cBlack),
          ),
        ),
        StaticData.gap2,
      ],
    );
  }
}
