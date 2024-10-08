import 'package:code_pay/bindings/models/detail_graph_model.dart';
import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:code_pay/common/widgets/reusable/reusable_class.dart';
import 'package:code_pay/data/bloc/jobs_data/jobs_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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

    int calculateDiff(String input) {
      String cleanedInput =
          input == '' ? '0,00,00 - 0,00,00,00' : input.replaceAll(' INR', '');
      List<String> numbers = cleanedInput.split('-');
      int num1 = int.parse(numbers[0].replaceAll(',', ''));
      int num2 = int.parse(numbers[1].replaceAll(',', ''));

      return num2 - num1;
    }

    graphData(List sl, s) {
      for (int i = 0; i < sl.length; i++) {
        // print(s[i].jobsalary);
        var value = calculateDiff(s[i].jobsalary);
        data.add(
          SalaryGraphClass(jobname: s[i].jobname, salary: value),
        );
      }
    }

    return BlocBuilder<JobsDataBloc, JobsDataState>(
      builder: (context, state) {
        if (state is JobDataLoading) {
          return Shimmer.fromColors(
            baseColor: csGrey,
            highlightColor: cWhite,
            child: Container(
              height: scrnsize.height * 0.42,
              width: scrnsize.width * 0.95,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        } else if (state is JobDataError) {
          return Container(
            height: scrnsize.height * 0.42,
            width: scrnsize.width * 0.95,
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: txt.textWidget(state.error, 12.0, FontWeight.w600, cBlack),
          );
        } else if (state is JobDataLoaded) {
          graphData(state.jobs, state.jobs);
          return Container(
            height: scrnsize.height * 0.42,
            width: scrnsize.width * 0.95,
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SfCartesianChart(
              backgroundColor: cWhite,
              plotAreaBorderWidth: 0,
              title: ChartTitle(
                text: 'Top paying jobs',
                textStyle: txt.textStyle(10.0, FontWeight.w600, cBlack),
                alignment: ChartAlignment.near,
              ),
              legend: Legend(
                  isVisible: true,
                  textStyle: txt.textStyle(9.0, FontWeight.w600, cBlack)),
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: txt.textStyle(
                    8.0, FontWeight.w600, cBlack.withOpacity(0.6)),
                maximumLabelWidth: 50,
                autoScrollingMode: AutoScrollingMode.start,
              ),
              primaryYAxis: NumericAxis(
                axisLine: const AxisLine(width: 0),
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(size: 0),
                labelStyle: txt.textStyle(
                    8.0, FontWeight.w600, cBlack.withOpacity(0.6)),
                numberFormat: NumberFormat.compact(),
              ),
              series: [
                ColumnSeries<SalaryGraphClass, String>(
                  dataSource: data,
                  xValueMapper: (SalaryGraphClass data, _) => data.jobname,
                  yValueMapper: (SalaryGraphClass data, _) => data.salary,
                  isTrackVisible: true,
                  color: const Color(0xFF0caf60),
                  trackColor: csGrey.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(5),
                  name: 'Salary per month',
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
          height: scrnsize.height * 0.42,
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
