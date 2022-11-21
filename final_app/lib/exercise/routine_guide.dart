import 'package:final_app/exercise/const/routine_card.dart';
import 'package:final_app/record/const/add_record.dart';
import 'package:final_app/record/record_calendar.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:final_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

class RoutineGuide extends StatefulWidget {
  final loginID;
  final routineName;
  final exerciseName;
  final exerciseImage1;
  final exerciseImage2;
  final exerciseStep;
  final number;
  final numberUnit;

  const RoutineGuide({
    required this.loginID,
    required this.routineName,
    required this.exerciseName,
    required this.exerciseStep,
    required this.exerciseImage1,
    required this.exerciseImage2,
    required this.number,
    required this.numberUnit,
    Key? key,
  }) : super(key: key);

  @override
  State<RoutineGuide> createState() => _RoutineGuideState();
}

class _RoutineGuideState extends State<RoutineGuide> {
  @override
  Widget build(BuildContext context) {
    int grade = 5;
    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID),
      appBar: MyAppBar(grade: grade),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: PRIMARY_COLOR[grade],
        heroTag: 'memo',
        child: Icon(Icons.edit_calendar,
            color: (grade == 0 ||
                    grade == 1 ||
                    grade == 2 ||
                    grade == 4 ||
                    grade == 8)
                ? Colors.black
                : Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: AddRecord(
                    grade: grade,
                    selectedDate: DateTime.now(),
                    loginID: widget.loginID),
                scrollable: true,
              );
            },
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.routineName}',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              //ListView 안에서 for문으로 RoutineCard 불러오기, 루틴 이름을 ListView의 최상단으로 옮김
              //ListView를 Expanded로 사용
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    //widget.은 리스트로 오고 내부변수는 각각으로 해야하나
                    final exerciseName = widget.exerciseName;
                    final exerciseImage1 = widget.exerciseImage1;
                    final exerciseImage2 = widget.exerciseImage2;
                    final exerciseStep = widget.exerciseStep;
                    final number = widget.number;

                    return RoutineCard(
                      exerciseName: exerciseName,
                      number: number,
                      exerciseImage1: exerciseImage1,
                      exerciseImage2: exerciseImage2,
                      exerciseStep: exerciseStep,
                      numberUnit: widget.numberUnit,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 8.0);
                  },
                  itemCount: 3),
            ),
          ],
        ),
      ),
    );
  }
}
