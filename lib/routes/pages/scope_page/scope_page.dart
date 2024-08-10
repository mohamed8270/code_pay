import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/routes/pages/scope_page/widgets/competetive_widget.dart';
import 'package:code_pay/routes/pages/scope_page/widgets/highpay_widget.dart';
import 'package:code_pay/routes/pages/scope_page/widgets/impression_widget.dart';
import 'package:flutter/material.dart';

class ScopePage extends StatelessWidget {
  const ScopePage({super.key});

  @override
  Widget build(BuildContext context) {
    var txt = TextFond();
    return Scaffold(
      backgroundColor: cbGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: cWhite,
            border: Border(
              bottom: BorderSide(width: 1.3, color: cBlack.withOpacity(0.05)),
            ),
          ),
          alignment: Alignment.center,
          child: AppBar(
            backgroundColor: cWhite,
            scrolledUnderElevation: 0,
            title: txt.textWidget(
                'Job Analytics  ✨', 13.0, FontWeight.w600, cBlack),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            StaticData.gap2,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImpressionsWidget(),
                CompetetiveWidget(),
              ],
            ),
            StaticData.gap3,
            const HighpayWidget(),
          ],
        ),
      ),
    );
  }
}
