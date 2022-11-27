import 'dart:math';

import 'package:final_app/record/const/add_weight.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RecordGraph extends StatefulWidget {
  final loginID;
  final grade;
  const RecordGraph({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<RecordGraph> createState() => _RecordGraphState();
}

class _RecordGraphState extends State<RecordGraph> {
  @override
  Widget build(BuildContext context) {
    /*
    select: 체중 기록
     */
    List<int> recordDate = [20220901, 20220905, 20220908, 20220909, 20220910];
    List<double> weight = [45.5, 50.7, 47.3, 57.9, 55.5];
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

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text('체중', style: TextStyle(fontSize: 25.0)),
          SizedBox(height: 16.0),
          SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 250.0,
              width: dif * 40 < MediaQuery.of(context).size.width
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width + dif * 40,
              color: PRIMARY_COLOR[widget.grade].withOpacity(0.03),
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(
                  intervalType: DateTimeIntervalType.days,
                  interval: 1,
                  rangePadding: ChartRangePadding.additional,
                ),
                primaryYAxis: NumericAxis(
                  minimum: weight.reduce(min) - 5,
                  maximum: weight.reduce(max) + 5,
                  isVisible: false,
                ),
                series: <ChartSeries>[
                  LineSeries<WeightData, DateTime>(
                    markerSettings: MarkerSettings(
                        isVisible: true,
                        height: 8.0,
                        width: 8.0,
                        color: Colors.white,
                        borderColor: widget.grade == 0
                            ? Colors.grey.withOpacity(0.1)
                            : widget.grade == 2
                                ? Colors.yellow[600]
                                : widget.grade == 8
                                    ? Colors.lightGreen[200]
                                    : PRIMARY_COLOR[widget.grade],
                        shape: DataMarkerType.circle),
                    color: widget.grade == 0
                        ? Colors.grey.withOpacity(0.1)
                        : widget.grade == 2
                            ? Colors.yellow[600]
                            : widget.grade == 8
                                ? Colors.lightGreen[200]
                                : PRIMARY_COLOR[widget.grade],
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
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: AddWeight(
                        loginID: widget.loginID,
                        grade: widget.grade,
                      ),
                      scrollable: true,
                    );
                  },
                );
              },
              child: Text('체중입력', style: TextStyle(color: Colors.black)),
            ),
          )
        ],
      ),
    );
  }
}

class WeightData {
  WeightData(this.date, this.weight);
  final DateTime date;
  final double weight;
}
