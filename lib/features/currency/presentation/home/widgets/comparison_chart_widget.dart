import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/comparison_data.dart';

class ComparisonChartWidget extends StatefulWidget {
  final List<ComparisonData> history;

  const ComparisonChartWidget({super.key, required this.history});

  @override
  State<ComparisonChartWidget> createState() => _ComparisonChartWidgetState();
}

class _ComparisonChartWidgetState extends State<ComparisonChartWidget> {
  String selectedMetric = 'bid';
  final double pointWidth = 24.0;
  final int visiblePointCount = 20;

  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chartWidth = widget.history.length * pointWidth;
      final visibleWidth = visiblePointCount * pointWidth;

      if (_scrollController.hasClients && chartWidth > visibleWidth) {
        _scrollController.animateTo(
          chartWidth - visibleWidth,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<FlSpot> _mapToSpots(String metric) {
    return widget.history
        .reversed
        .toList()
        .asMap()
        .entries
        .map((e) {
      final value = switch (metric) {
        'bid' => e.value.bid,
        'ask' => e.value.ask,
        'high' => e.value.high,
        'low' => e.value.low,
        'pctChange' => e.value.pctChange,
        _ => 0.0,
      };
      return FlSpot(e.key.toDouble(), value);
    })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.history.isEmpty) return const SizedBox.shrink();

    final spots = _mapToSpots(selectedMetric);

    final chartWidth = widget.history.length * pointWidth;
    final visibleWidth = visiblePointCount * pointWidth;
    final minY = spots.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final yPadding = (maxY - minY) * 0.3;
    final chartMinY = (minY - yPadding).toDouble();
    final chartMaxY = (maxY + yPadding);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<String>(
          value: selectedMetric,
          items: const [
            DropdownMenuItem(value: 'bid', child: Text('Bid')),
            DropdownMenuItem(value: 'ask', child: Text('Ask')),
            DropdownMenuItem(value: 'high', child: Text('High')),
            DropdownMenuItem(value: 'low', child: Text('Low')),
            DropdownMenuItem(value: 'pctChange', child: Text('% Change')),
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() => selectedMetric = value);
            }
          },
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 260,
          width: visibleWidth,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: SizedBox(
              width: chartWidth,
              child: AspectRatio(
                aspectRatio: 3,
                child: LineChart(
                  LineChartData(
                    minY: chartMinY,
                    maxY: chartMaxY,
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: Colors.deepPurple,
                        barWidth: 2.5,
                        dotData: FlDotData(show: true),
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        tooltipBgColor: Colors.black87,
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((spot) {
                            return LineTooltipItem(
                              spot.y.toStringAsFixed(2),
                              const TextStyle(color: Colors.white, fontSize: 12),
                            );
                          }).toList();
                        },
                      ),
                      handleBuiltInTouches: true,
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 8,
                          getTitlesWidget: (value, meta) {
                            if (value == 0) {
                              return const Text('0', style: TextStyle(fontSize: 10));
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1.0,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (index < 0 || index >= widget.history.length) return const SizedBox.shrink();
                            final date = widget.history[index].date;
                            return Text('${date.day}/${date.month}', style: const TextStyle(fontSize: 10));
                          },
                        ),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawHorizontalLine: false,
                      drawVerticalLine: true,
                      getDrawingVerticalLine: (value) => FlLine(
                        color: Colors.grey.withOpacity(0.2),
                        strokeWidth: 1,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    extraLinesData: ExtraLinesData(
                      horizontalLines: [
                        HorizontalLine(
                          y: 0,
                          color: Colors.black26,
                          strokeWidth: 1,
                          label: HorizontalLineLabel(
                            show: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
