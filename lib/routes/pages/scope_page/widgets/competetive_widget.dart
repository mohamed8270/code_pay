import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/data/bloc/jobs_data/jobs_data_bloc.dart';
import 'package:code_pay/routes/pages/scope_page/reusable/analytics_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CompetetiveWidget extends StatelessWidget {
  const CompetetiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var txt = TextFond();

    addApplyData(al, a) {
      var applylist = [];
      for (int i = 0; i < al; i++) {
        String res = a[i].jobapplied;
        String aStr = res.replaceAll(RegExp(r'[^0-9]'), '');
        int apply = int.parse(aStr);
        if (apply >= 200) {
          applylist.add(apply);
        }
      }

      var sum = applylist.reduce((value, element) => value + element);
      return sum.toString();
    }

    return BlocBuilder<JobsDataBloc, JobsDataState>(
      builder: (context, state) {
        if (state is JobDataLoading) {
          return Shimmer.fromColors(
            baseColor: csGrey,
            highlightColor: cWhite,
            child: Container(
              height: scrnsize.height * 0.15,
              width: scrnsize.width * 0.45,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        } else if (state is JobDataLoaded) {
          final sum = addApplyData(state.jobs.length, state.jobs);
          return AnalyticsCard(
            h: 0.15,
            w: 0.45,
            icn: StaticData.send,
            t1: 'Competetive',
            t2: sum,
            t3: 'from last week',
            click: () {},
          );
        } else if (state is JobDataError) {
          return Container(
            height: scrnsize.height * 0.15,
            width: scrnsize.width * 0.45,
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: txt.textWidget(state.error, 10.0, FontWeight.w600, cBlack),
          );
        }
        return Container(
          height: scrnsize.height * 0.15,
          width: scrnsize.width * 0.45,
          decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: txt.textWidget('No Data', 10.0, FontWeight.w600, cBlack),
        );
      },
    );
  }
}
