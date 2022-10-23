import 'package:final_app/record/const/add_weight.dart';
import 'package:final_app/record/const/record_list_exercise.dart';
import 'package:final_app/record/record_calendar.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExerciseRecord extends StatefulWidget {
  const ExerciseRecord({Key? key}) : super(key: key);

  @override
  State<ExerciseRecord> createState() => _ExerciseRecordState();
}

class _ExerciseRecordState extends State<ExerciseRecord> {
  int grade = 0;
  int exerciseNumber = 0;
  int todayReportTime = 0;
  final week = ['일', '월', '화', '수', '목', '금', '토'];

  @override
  Widget build(BuildContext context) {
    //운동 시간 구하는 코드
    List<int> exerciseTime = [0, 0, 20, 30, 10, 5, 0];
    List<FlSpot> myWeight = [
      //기록을 yymmdd로 날짜를 정하고 x축으로 하면 될까? y축은 체중
      // 날짜 / 10000 = yy, tmp / 100 = mm, tmp % 100 = dd (전부 두 자리로 만들기)
      FlSpot(20221001, 50),
      FlSpot(20221004, 55.3),
      FlSpot(20221009, 52.4),
      FlSpot(20221018, 57.7),
      FlSpot(20221022, 45.6),
    ];

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
                  width: MediaQuery.of(context).size.width / 2 - 16,
                  height: 70.0,
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
              GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 16,
                  height: 70.0,
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            color: Colors.green[300],
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
              child: Text('체중입력'),
            ),
          )
        ],
      ),
    );
  }
}
