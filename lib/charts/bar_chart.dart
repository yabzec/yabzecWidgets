import 'dart:math';

import 'package:fl_chart/fl_chart.dart' as c;
import 'package:flutter/material.dart';
import 'package:yabzec_widgets/globals.dart';

class BarChart<T> extends StatefulWidget {
  const BarChart(
    this.data, {
    super.key,
    this.minY,
    this.maxY,
    this.xLabel,
    required this.coordinatesBuilder,
    this.barWidth,
  });

  final List<T> data;
  final Point Function(T) coordinatesBuilder;
  final double? minY;
  final double? maxY;
  final double? barWidth;
  final String Function(double value)? xLabel;

  @override
  State<BarChart<T>> createState() => _BarChartState<T>();
}

class _BarChartState<T> extends State<BarChart<T>> {
  late final List<Point> points;
  late final Map<double, String Function(double)> xLabels;

  @override
  Widget build(BuildContext context) {
    return c.BarChart(
      c.BarChartData(
        minY: widget.minY,
        maxY: widget.maxY,
        barGroups: points
            .map(
              (p) => c.BarChartGroupData(
                x: p.x.toInt(),
                barRods: [
                  c.BarChartRodData(
                    toY: p.y.toDouble(),
                    width: widget.barWidth,
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    color: const Color(0xFF1A4C4D),
                    rodStackItems: [
                      c.BarChartRodStackItem(
                        p.y.toDouble() - 0.05,
                        p.y.toDouble(),
                        const Color(0xFF38A3A5),
                      ),
                    ],
                  ),
                ],
              ),
            )
            .toList(),
        groupsSpace: 10,
        titlesData: c.FlTitlesData(
          rightTitles: c.AxisTitles(
            sideTitles: c.SideTitles(showTitles: false),
          ),
          topTitles: c.AxisTitles(sideTitles: c.SideTitles(showTitles: false)),
          bottomTitles: c.AxisTitles(
            sideTitles: c.SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ),
          ),
          leftTitles: c.AxisTitles(sideTitles: c.SideTitles(showTitles: false)),
        ),
        gridData: const c.FlGridData(drawVerticalLine: false),
        borderData: c.FlBorderData(show: false),
      ),
      duration: Globals.animationDuration,
      curve: Globals.animationCurve,
    );
  }

  @override
  void initState() {
    super.initState();
    points = widget.data.map((elm) {
      Point point = widget.coordinatesBuilder(elm);
      return point;
    }).toList();
  }

  Widget getBottomTitles(double value, c.TitleMeta meta) {
    return c.SideTitleWidget(
      meta: meta,
      child: Text(
        widget.xLabel?.call(value) ?? value.toStringAsFixed(0),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
