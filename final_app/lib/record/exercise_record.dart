import 'dart:math';

import 'package:final_app/record/const/add_weight.dart';
import 'package:final_app/record/const/record_list_exercise.dart';
import 'package:final_app/record/record_calendar.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExerciseRecord extends StatefulWidget {
  const ExerciseRecord({Key? key}) : super(key: key);

  @override
  State<ExerciseRecord> createState() => _ExerciseRecordState();
}

class _ExerciseRecordState extends State<ExerciseRecord> {
  @override
  Widget build(BuildContext context) {
    //운동 시간 구하는 코드
    List<int> exerciseTime = [0, 0, 20, 30, 10, 5, 0];
    List<int> recordDate = [20220901, 20220905, 20220908, 20220909, 20220910];
    List<double> weight = [45.5, 50.7, 47.3, 57.9, 55.5];
    List<WeightData> data = [];
    int grade = 0;
    int exerciseNumber = 0;
    //int todayReportTime = 0;
    final week = ['일', '월', '화', '수', '목', '금', '토'];

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
          Text('오늘의 운동', style: TextStyle(fontSize: 25.0)),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  //width: MediaQuery.of(context).size.width / 2 - 16,
                  width: MediaQuery.of(context).size.width - 32,
                  height: 70.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: PRIMARY_COLOR[grade],
                  )),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '$exerciseNumber종류',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                onTap: () {
                  //운동 종류로 이동하는 코드
                  //운동 종류를 모두 불러오는 코드
                  List<String> exerciseLst = [
                    '운동1',
                    '운동2',
                    '운동3',
                    '운동4',
                    '운동5',
                    '운동6'
                  ];
                  List<int> exerciseNumber = [15, 5, 20, 20, 10, 30];
                  List<String> isTime = ['f', 'f', 't', 't', 'f', 't'];

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => RecordListExercise(
                        exerciseName: exerciseLst,
                        exerciseNumber: exerciseNumber,
                        isTime: isTime,
                      ),
                    ),
                  );
                },
              ),
              /*
              GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 16,
                  height: 70.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: PRIMARY_COLOR[grade],
                  )),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '$todayReportTime초',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                onTap: () {
                  //db내 운동 시간을 수정할 수 있는 코드
                },
              ),
               */
            ],
          ),
          SizedBox(height: 16.0),
          Text('기록', style: TextStyle(fontSize: 25.0)),
          SizedBox(height: 16.0),
          GestureDetector(
            child: Container(
              height: 80.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 7; i++)
                    Column(
                      children: [
                        Text(week[i]),
                        exerciseTime[i] != 0
                            ? Icon(
                                Icons.check_circle_outline,
                                size: MediaQuery.of(context).size.width / 8,
                                color: PRIMARY_COLOR[grade],
                              )
                            : Icon(
                                Icons.cancel_outlined,
                                size: MediaQuery.of(context).size.width / 8,
                                color: Colors.grey[300],
                              ),
                      ],
                    ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ReportCalendar(),
                ),
              );
            },
          ),
          SizedBox(height: 16.0),
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
              color: PRIMARY_COLOR[grade].withOpacity(0.05),
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
                        borderColor: PRIMARY_COLOR[grade] == Colors.white
                            ? Colors.grey
                            : PRIMARY_COLOR[grade] == Colors.yellow
                                ? Colors.yellow[700]
                                : PRIMARY_COLOR[grade],
                        shape: DataMarkerType.circle),
                    color: PRIMARY_COLOR[grade] == Colors.white
                        ? Colors.grey
                        : PRIMARY_COLOR[grade] == Colors.yellow
                            ? Colors.yellow[700]
                            : PRIMARY_COLOR[grade],
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
                      content: AddWeight(),
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
