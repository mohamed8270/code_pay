import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/data/bloc/jobs_data/jobs_data_bloc.dart';
import 'package:code_pay/routes/pages/scope_page/reusable/analytics_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HighpayWidget extends StatelessWidget {
  const HighpayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var txt = TextFond();
    var use = ReusableClass();

    String addHighPay(sl, s) {
      var payout = '1,00,000 - 1,00,00,00';
      for (int i = 0; i < sl; i++) {
        String res = s[i].jobsalary;
        RegExp regex = RegExp(r'-\s*([\d,]+)');
        Match? matchs = regex.firstMatch(res);

        if (matchs != null) {
          String pStr = matchs.group(1) ?? '';
          int highpay = int.parse(pStr.replaceAll(',', ''));
          if (highpay >= 300) {
            payout = res;
          }
        }
      }

      return payout.toString();
    }

    return BlocBuilder<JobsDataBloc, JobsDataState>(
      builder: (context, state) {
        if (state is JobDataLoading) {
          return Shimmer.fromColors(
            baseColor: csGrey,
            highlightColor: cWhite,
            child: Container(
              height: scrnsize.height * 0.15,
              width: scrnsize.width * 0.95,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        } else if (state is JobDataError) {
          return Container(
            height: scrnsize.height * 0.15,
            width: scrnsize.width * 0.95,
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: txt.textWidget(state.error, 10.0, FontWeight.w600, cBlack),
          );
        } else if (state is JobDataLoaded) {
          final sum = addHighPay(state.jobs.length, state.jobs);
          return AnalyticsCard(
            h: 0.15,
            w: 0.95,
            icn: StaticData.money,
            t1: 'High Paying',
            t2: sum,
            t3: 'from last week',
            click: () {},
          );
        }
        return Container(
          height: scrnsize.height * 0.15,
          width: scrnsize.width * 0.95,
          decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: use.circularLoading(),
        );
      },
    );
  }
}
