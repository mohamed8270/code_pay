import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // text widget
    final text = TextFond();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: StaticData.p2, right: StaticData.p2),
        child: Column(
          children: [
            const CustomAppBar(),
            text.textWidget(StaticData.heroText, 32, Weight.w6, cBlack),
          ],
        ),
      ),
    );
  }
}
