import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/routes/pages/scope_page/reusable/analytics_card.dart';
import 'package:flutter/material.dart';

class ScopePage extends StatelessWidget {
  const ScopePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var icn = ReusableClass();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnalyticsCard(
                  h: 0.15,
                  w: 0.45,
                  icn: StaticData.view,
                  t1: 'Impressions',
                  t2: '456K',
                  t3: 'from last week',
                ),
                AnalyticsCard(
                  h: 0.15,
                  w: 0.45,
                  icn: StaticData.applyicn,
                  t1: 'Competetive',
                  t2: '500',
                  t3: 'from last week',
                ),
              ],
            ),
            StaticData.gap3,
            AnalyticsCard(
              h: 0.15,
              w: 0.95,
              icn: StaticData.money,
              t1: 'High Paying',
              t2: '1,00,000 - 10,00,000',
              t3: 'from last week',
            ),
          ],
        ),
      ),
    );
  }
}
