import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ChartA extends StatelessWidget {
  const ChartA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> data = [40.0, 45.0, 50.0, 55.0, 60.0, 56.0, 45.0];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width + data.length,
        child: LineChart(
          LineChartData(
            minY: data.reduce(min) - 5,
            maxY: data.reduce(max) + 5,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  for (int i = data.length - 1; i >= 0; i--)
                    FlSpot(i.toDouble(), data[i]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
