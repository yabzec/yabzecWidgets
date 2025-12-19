import 'package:fl_chart/fl_chart.dart' as c;
import 'package:flutter/material.dart';
import 'package:yabzec_widgets/globals.dart';

export 'package:fl_chart/src/chart/pie_chart/pie_chart_data.dart'
    show PieChartSectionData;

class PieChart<T> extends StatelessWidget {
  const PieChart(this.data, {super.key});

  final List<c.PieChartSectionData> data;

  @override
  Widget build(BuildContext context) {
    return c.PieChart(
      c.PieChartData(sections: data),
      duration: Globals.animationDuration,
      curve: Globals.animationCurve,
    );
  }
}
