import 'package:code_pay/bindings/models/detail_graph_model.dart';
import 'package:code_pay/common/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphRepo extends StatefulWidget {
  final List applied, views;

  const GraphRepo({super.key, required this.applied, required this.views});

  @override
  State<GraphRepo> createState() => _GraphRepoState();
}

class _GraphRepoState extends State<GraphRepo> {
  List<ViewsvsApplied> chartData = [];
  graphData() {
    for (int i = 0; i > widget.applied.length; i++) {
      chartData.add(
        ViewsvsApplied(
          viewsgraph: widget.views[i]['views'],
          appliedgraph: widget.applied[i]['applied'],
          date: widget.views[i]['Date'],
        ),
      );
    }

    print(chartData);
  }

  @override
  void initState() {
    super.initState();
    graphData();
  }

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    return Container(
      height: scrnsize.height * 0.4,
      width: scrnsize.width,
      decoration: BoxDecoration(
        color: cbGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        title: ChartTitle(
          text: 'Job Growth',
          textStyle: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: cGreen,
          ),
        ),
        legend: const Legend(isVisible: true),
        series: [
          LineSeries<ViewsvsApplied, DateTime>(
            dataSource: chartData,
            xValueMapper: (ViewsvsApplied data, _) => data.date,
            yValueMapper: (ViewsvsApplied data, _) => data.appliedgraph,
            name: 'Applied',
          ),
          LineSeries<ViewsvsApplied, DateTime>(
            dataSource: chartData,
            xValueMapper: (ViewsvsApplied data, _) => data.date,
            yValueMapper: (ViewsvsApplied data, _) => data.viewsgraph,
            name: 'Views',
          ),
        ],
      ),
    );
  }
}
