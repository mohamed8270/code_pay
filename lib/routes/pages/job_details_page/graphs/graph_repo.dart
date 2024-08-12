import 'package:code_pay/bindings/models/detail_graph_model.dart';
import 'package:code_pay/common/styles/color.dart';
import 'package:code_pay/common/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Views vs Applied Graph data [Lack Skills]
class GraphRepoLack extends StatefulWidget {
  final List applied, views;

  const GraphRepoLack({super.key, required this.applied, required this.views});

  @override
  State<GraphRepoLack> createState() => _GraphRepoLackState();
}

class _GraphRepoLackState extends State<GraphRepoLack> {
  List<ViewsvsApplied> chartData = [];

  @override
  void initState() {
    super.initState();
    graphData();
  }

  graphData() {
    for (int i = 0; i < widget.views.length; i++) {
      // print('views: ${widget.applied[i]['views']}');
      // print(widget.applied);
      // print(widget.views);
      // print('function running');
      chartData.add(
        ViewsvsApplied(
          viewsgraph: widget.views[i]['views'] ?? 0,
          appliedgraph: widget.applied[i]['apply'] ?? 0,
          date: widget.views[i]['Date'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var txt = TextFond();
    return Container(
      height: scrnsize.height * 0.4,
      width: scrnsize.width,
      decoration: BoxDecoration(
        color: cbGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelStyle:
              txt.textStyle(8.0, FontWeight.w600, cBlack.withOpacity(0.6)),
          maximumLabelWidth: 50,
        ),
        primaryYAxis: CategoryAxis(
          labelStyle:
              txt.textStyle(8.0, FontWeight.w600, cBlack.withOpacity(0.6)),
          maximumLabelWidth: 20,
        ),
        title: ChartTitle(
          text: 'Job Growth (Views vs Applied)',
          alignment: ChartAlignment.near,
          textStyle: txt.textStyle(10.0, FontWeight.w600, cBlack),
        ),
        legend: const Legend(isVisible: true),
        series: [
          SplineSeries<ViewsvsApplied, DateTime>(
            dataSource: chartData,
            xValueMapper: (ViewsvsApplied data, _) => DateTime.parse(data.date),
            yValueMapper: (ViewsvsApplied data, _) => data.appliedgraph,
            name: 'Applied',
          ),
          SplineSeries<ViewsvsApplied, DateTime>(
            dataSource: chartData,
            xValueMapper: (ViewsvsApplied data, _) => DateTime.parse(data.date),
            yValueMapper: (ViewsvsApplied data, _) => data.viewsgraph,
            name: 'Views',
          ),
        ],
      ),
    );
  }
}

// Views vs Posted Graph data [Competition]
class GraphRepoCom extends StatefulWidget {
  final List views, post;
  const GraphRepoCom({super.key, required this.views, required this.post});

  @override
  State<GraphRepoCom> createState() => _GraphRepoComState();
}

class _GraphRepoComState extends State<GraphRepoCom> {
  List<ViewsvsPost> chartData = [];

  @override
  void initState() {
    super.initState();
    graphData();
  }

  graphData() {
    for (int i = 0; i < widget.views.length; i++) {
      // print('views: ${widget.applied[i]['views']}');
      // print(widget.applied);
      // print(widget.views);
      // print('function running');
      chartData.add(
        ViewsvsPost(
          viewsgraph: widget.views[i]['views'] ?? 0,
          postedgraph: widget.post[i]['posted'] ?? 0,
          date: widget.views[i]['Date'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scrnsize = MediaQuery.sizeOf(context);
    var txt = TextFond();
    return Container(
      height: scrnsize.height * 0.4,
      width: scrnsize.width,
      decoration: BoxDecoration(
        color: cbGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelStyle:
              txt.textStyle(8.0, FontWeight.w600, cBlack.withOpacity(0.6)),
          maximumLabelWidth: 50,
        ),
        primaryYAxis: CategoryAxis(
          labelStyle:
              txt.textStyle(8.0, FontWeight.w600, cBlack.withOpacity(0.6)),
          maximumLabelWidth: 20,
        ),
        title: ChartTitle(
          text: 'Job Growth (Posted vs Views)',
          alignment: ChartAlignment.near,
          textStyle: txt.textStyle(10.0, FontWeight.w600, cBlack),
        ),
        legend: const Legend(isVisible: true),
        series: [
          SplineSeries<ViewsvsPost, DateTime>(
            dataSource: chartData,
            xValueMapper: (ViewsvsPost data, _) => DateTime.parse(data.date),
            yValueMapper: (ViewsvsPost data, _) => data.postedgraph,
            name: 'Posted',
          ),
          SplineSeries<ViewsvsPost, DateTime>(
            dataSource: chartData,
            xValueMapper: (ViewsvsPost data, _) => DateTime.parse(data.date),
            yValueMapper: (ViewsvsPost data, _) => data.viewsgraph,
            name: 'Views',
          ),
        ],
      ),
    );
  }
}
