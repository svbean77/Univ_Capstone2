import 'package:flutter/material.dart';
import 'package:graph/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class ChartB extends StatelessWidget {
  const ChartB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> recordDate = [
      20220901,
      20220905,
      20220908,
      20220909,
      20220910,
      20220911,
      20220914,
      20220916,
      20220920,
      20220930
    ];
    List<double> weight = [
      45.5,
      50.7,
      47.0,
      40.0,
      40.0,
      40.0,
      40.0,
      45.5,
      50.7,
      47.0,
      40.0,
    ];
    List<WeightData> data = [];

    for (int i = 0; i < recordDate.length; i++) {
      int year = recordDate[i] ~/ 10000;
      int month = (recordDate[i] % 10000) ~/ 100;
      int day = recordDate[i] % 100;
      data.add(
        WeightData(DateTime(year, month, day), weight[i]),
      );
    }

    int dif = data[data.length - 1].date.difference(data[0].date).inDays;
    int idx = 0;

    return ListView(
      children: [
        Container(
          height: 300.0,
        ),
        SingleChildScrollView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 250.0,
            width: dif * 40 < MediaQuery.of(context).size.width
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width + dif * 40,
            color: myColor[idx].withOpacity(0.05),
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(
                intervalType: DateTimeIntervalType.days,
                interval: 1,
                rangePadding: ChartRangePadding.additional,
              ),
              primaryYAxis: NumericAxis(
                minimum: weight.reduce(min) - 5,
                maximum: weight.reduce(max) + 5,
                //title: AxisTitle(text: '체중(kg)'),
                isVisible: false,
              ),
              series: <ChartSeries>[
                LineSeries<WeightData, DateTime>(
                  markerSettings: MarkerSettings(
                      isVisible: true,
                      height: 8.0,
                      width: 8.0,
                      color: Colors.white,
                      borderColor: myColor[idx] == Colors.white
                          ? Colors.grey
                          : myColor[idx] == Colors.yellow
                              ? Colors.yellow[700]
                              : myColor[idx],
                      shape: DataMarkerType.circle),
                  color: myColor[idx] == Colors.white
                      ? Colors.grey
                      : myColor[idx] == Colors.yellow
                          ? Colors.yellow[700]
                          : myColor[idx],
                  dataSource: data,
                  xValueMapper: (WeightData info, _) => info.date,
                  yValueMapper: (WeightData info, _) => info.weight,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(color: Colors.grey[700]),
                  ),
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
