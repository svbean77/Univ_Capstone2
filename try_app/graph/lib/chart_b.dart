import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class ChartB extends StatelessWidget {
  const ChartB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> input = [
      20220901,
      20220905,
      20220908,
      20220909,
      20220910,
      20220911,
      20220912,
      20220913,
      20220914,
      20220915,
      20220916,
      20220917,
      20220918,
      20220919,
      20221020
    ];
    List<double> weight = [
      45.5,
      50.7,
      47.0,
      40.0,
      40.0,
      40.0,
      40.0,
      40.0,
      40.0,
      40.0,
      40.0,
      40.0,
      40.0,
      40.0,
      40.0
    ];
    List<WeightData> data = [];

    for (int i = 0; i < weight.length; i++) {
      int year = input[i] ~/ 10000;
      int month = (input[i] % 10000) ~/ 100;
      int day = input[i] % 100;
      data.add(
        WeightData(DateTime(year, month, day), weight[i]),
      );
    }

    return ListView(
      children: [
        Container(
          height: 300.0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 250.0,
            width: MediaQuery.of(context).size.width +
                data.length * (MediaQuery.of(context).size.width / 20),
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(),
              primaryYAxis: NumericAxis(
                minimum: weight.reduce(min) - 5,
                maximum: weight.reduce(max) + 5,
              ),
              series: <ChartSeries>[
                LineSeries<WeightData, DateTime>(
                  markerSettings: MarkerSettings(
                      isVisible: true,
                      height: 8.0,
                      width: 8.0,
                      color: Colors.white,
                      borderColor: Colors.blue,
                      shape: DataMarkerType.circle),
                  dataSource: data,
                  xValueMapper: (WeightData info, _) => info.date,
                  yValueMapper: (WeightData info, _) => info.weight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WeightData {
  WeightData(this.date, this.weight);
  final DateTime date;
  final double weight;
}
