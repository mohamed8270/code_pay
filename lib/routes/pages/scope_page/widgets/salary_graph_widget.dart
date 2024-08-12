import 'package:code_pay/bindings/models/detail_graph_model.dart';
import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/data/bloc/jobs_data/jobs_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalaryGraphWidget extends StatelessWidget {
  const SalaryGraphWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var txt = TextFond();
    var use = ReusableClass();

    // data list
    List<SalaryGraphClass> data = [];

    graphData(List sl, s) {
      for (int i = 0; i < sl.length; i++) {
        data.add(
          SalaryGraphClass(jobname: s.jobname, salary: s.jobsalary ?? 0),
        );
      }
    }

    int calculateDiff(String input) {
      String cleanedInput = input.replaceAll(' INR', '');
      List<String> numbers = cleanedInput.split('-');
      int num1 = int.parse(numbers[0].replaceAll(',', ''));
      int num2 = int.parse(numbers[1].replaceAll(',', ''));

      return num2 - num1;
    }

    return BlocBuilder<JobsDataBloc, JobsDataState>(
      builder: (context, state) {
        if (state is JobDataLoading) {
          return Shimmer.fromColors(
            baseColor: csGrey,
            highlightColor: cWhite,
            child: Container(
              height: scrnsize.height * 0.35,
              width: scrnsize.width * 0.95,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        } else if (state is JobDataError) {
          return Container(
            height: scrnsize.height * 0.35,
            width: scrnsize.width * 0.95,
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: txt.textWidget(state.error, 12.0, FontWeight.w600, cBlack),
          );
        } else if (state is JobDataLoaded) {
          graphData(state.jobs, state.jobs);
          return const SfCartesianChart();
        }
        return Container(
          height: scrnsize.height * 0.35,
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
