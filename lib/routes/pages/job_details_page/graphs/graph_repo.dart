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
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: cGreen,
          ),
        ),
        legend: const Legend(isVisible: true),
        series: [
          LineSeries(
            dataSource: [
              (widget.applied, widget.views),
            ],
            xValueMapper: (applied, _) => applied,
            yValueMapper: (views, _) => views,
          ),
        ],
      ),
    );
  }
}
