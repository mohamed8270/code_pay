import 'package:code_pay/bindings/models/detail_graph_model.dart';
import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/data/bloc/jobs_data/jobs_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class JobskillsGraphWidget extends StatelessWidget {
  const JobskillsGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var use = ReusableClass();
    var txt = TextFond();

    // class list
    List<SkillsGraphClass> data = [];

    // func
    sameJobCount(skl, sk) {
      for (int i = 0; i < skl; i++) {
        List res = sk[i].jobskills;
        Map<String, int> map = {};
        for (int j = 0; j < res.length; j++) {
          int count = map[res[j]] ?? 0;
          map[res[j]] = count + 1;
          print(map[res[j]]);
          print(res[j]);
          data.add(SkillsGraphClass(
            skills: res[j],
            count: map[res[j]] ?? 0,
            mapper: res[j],
          ));
        }
      }
    }

    return BlocBuilder<JobsDataBloc, JobsDataState>(
      builder: (context, state) {
        if (state is JobDataLoading) {
          return Shimmer.fromColors(
            baseColor: csGrey,
            highlightColor: cWhite,
            child: Container(
              height: scrnsize.height * 0.45,
              width: scrnsize.width * 0.95,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        } else if (state is JobDataError) {
          return Container(
            height: scrnsize.height * 0.45,
            width: scrnsize.width * 0.95,
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: txt.textWidget(state.error, 12.0, FontWeight.w600, cBlack),
          );
        } else if (state is JobDataLoaded) {
          sameJobCount(state.jobs.length, state.jobs);
          return Container(
            height: scrnsize.height * 0.45,
            width: scrnsize.width * 0.95,
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SfCircularChart(
              backgroundColor: cWhite,
              title: ChartTitle(
                text: 'Demanding Skills',
                textStyle: txt.textStyle(10.0, FontWeight.w600, cBlack),
                alignment: ChartAlignment.near,
              ),
              legend: const Legend(isVisible: true),
              series: [
                DoughnutSeries<SkillsGraphClass, String>(
                  dataSource: data,
                  explode: true,
                  explodeAll: true,
                  radius: '80%',
                  innerRadius: '30%',
                  groupMode: CircularChartGroupMode.value,
                  groupTo: 1,
                  explodeGesture: ActivationMode.singleTap,
                  xValueMapper: (SkillsGraphClass data, _) => data.skills,
                  yValueMapper: (SkillsGraphClass data, _) => data.count,
                  dataLabelMapper: (SkillsGraphClass data, _) => data.mapper,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    alignment: ChartAlignment.near,
                    labelAlignment: ChartDataLabelAlignment.auto,
                    textStyle: txt.textStyle(8.0, FontWeight.w600, cBlack),
                  ),
                ),
              ],
            ),
          );
        }
        return Container(
          height: scrnsize.height * 0.45,
          width: scrnsize.width * 0.95,
          decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(15),
          ),
          child: use.circularLoading(),
        );
      },
    );
  }
}
