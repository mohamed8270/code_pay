import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/styles/static.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/data/bloc/jobs_data/jobs_data_bloc.dart';
import 'package:code_pay/routes/pages/scope_page/reusable/analytics_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImpressionsWidget extends StatelessWidget {
  const ImpressionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var use = ReusableClass();
    var txt = TextFond();

    addViewsData(vl, v) {
      var viewsList = [];
      for (int i = 0; i < vl; i++) {
        String res = v[i].jobviews;
        String vStr = res.replaceAll(RegExp(r'[^0-9]'), '');
        int view = int.parse(vStr);
        if (view >= 300) {
          viewsList.add(view);
        }
      }

      var sum = viewsList.reduce((value, element) => value + element);
      return sum.toString();
    }

    return BlocBuilder<JobsDataBloc, JobsDataState>(
      builder: (context, state) {
        if (state is JobDataLoading) {
          return Container(
            height: scrnsize.height * 0.15,
            width: scrnsize.width * 0.45,
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: use.circularLoading(),
          );
        } else if (state is JobDataLoaded) {
          final sum = addViewsData(state.jobs.length, state.jobs);

          return AnalyticsCard(
            h: 0.15,
            w: 0.45,
            icn: StaticData.view,
            t1: 'Impressions',
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
        return const Text('No Data');
      },
    );
  }
}
