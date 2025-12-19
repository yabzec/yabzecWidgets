import 'dart:math';

import 'package:fl_chart/fl_chart.dart' as c;
import 'package:flutter/material.dart';
import 'package:yabzec_widgets/globals.dart';

class LineChart<T> extends StatefulWidget {
  const LineChart(
    this.data, {
    super.key,
    required this.coordinatesBuilder,
    this.minX,
    this.minY,
    this.maxX,
    this.maxY,
    this.xLabel,
    this.yLabel,
    this.yInterval = 1,
    this.xInterval,
    this.showYLabel = true,
    this.showXLabel = true,
    this.drawHorizontalLines = true,
    this.yLabelWidth = 30,
    this.isCurved = false,
    this.showDots = true,
  });

  final List<T> data;
  final Point Function(T) coordinatesBuilder;
  final double? minX;
  final double? minY;
  final double? maxX;
  final double? maxY;
  final double yLabelWidth;
  final bool showYLabel;
  final bool showXLabel;
  final bool drawHorizontalLines;
  final double yInterval;
  final double? xInterval;
  final String Function(double value)? xLabel;
  final String Function(double value)? yLabel;
  final bool isCurved;
  final bool showDots;

  @override
  State<LineChart<T>> createState() => _LineChartState<T>();
}

class _LineChartState<T> extends State<LineChart<T>> {
  late final List<Point> points;
  late final Map<double, String Function(double)> xLabels;

  @override
  Widget build(BuildContext context) {
    return c.LineChart(
      c.LineChartData(
        minX: widget.minX,
        maxX: widget.maxX,
        minY: widget.minY,
        maxY: widget.maxY,
        lineBarsData: [
          c.LineChartBarData(
            spots: getData(),
            color: const Color(0xFF38A3A5),
            isCurved: widget.isCurved,
            preventCurveOverShooting: true,
            dotData: c.FlDotData(show: widget.showDots),
          ),
        ],
        titlesData: c.FlTitlesData(
          rightTitles: c.AxisTitles(
            sideTitles: c.SideTitles(showTitles: false),
          ),
          topTitles: c.AxisTitles(sideTitles: c.SideTitles(showTitles: false)),
          bottomTitles: c.AxisTitles(
            sideTitles: c.SideTitles(
              reservedSize: 36,
              interval: widget.xInterval ?? points.last.x / (points.length - 1),
              showTitles: true,
              getTitlesWidget: widget.showXLabel
                  ? getBottomTitles
                  : (_, __) => SizedBox(),
            ),
          ),
          leftTitles: c.AxisTitles(
            sideTitles: c.SideTitles(
              interval: widget.yInterval,
              showTitles: widget.showYLabel,
              getTitlesWidget: getLeftTitles,
              reservedSize: widget.yLabelWidth,
            ),
          ),
        ),
        gridData: c.FlGridData(
          drawVerticalLine: false,
          drawHorizontalLine: widget.drawHorizontalLines,
        ),
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
        style: Theme.of(context).textTheme.labelSmall!.copyWith(height: 3.5),
      ),
    );
  }

  Widget getLeftTitles(double value, c.TitleMeta meta) {
    return c.SideTitleWidget(
      meta: meta,
      fitInside: c.SideTitleFitInsideData(
        enabled: true,
        axisPosition: 0,
        parentAxisSize: 10,
        distanceFromEdge: 0,
      ),
      child: SizedBox(
        width: widget.yLabelWidth,
        child: Text(
          widget.yLabel?.call(value) ?? value.toStringAsFixed(0),
          style: Theme.of(context).textTheme.labelMedium,
          maxLines: 1,
        ),
      ),
    );
  }

  List<c.FlSpot> getData() {
    return points
        .map((point) => c.FlSpot(point.x.toDouble(), point.y.toDouble()))
        .toList();
  }
}
