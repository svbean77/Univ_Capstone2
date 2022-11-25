import 'package:final_app/exercise/const/routine_card.dart';
import 'package:final_app/record/const/add_record.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
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
        child: ListView(
          children: [
            Text(
              '${widget.routineName}',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 16.0),
            for (int i = 0; i < 3; i++)
              RoutineCard(
                exerciseName: widget.exerciseName,
                number: widget.number,
                exerciseImage1: widget.exerciseImage1,
                exerciseImage2: widget.exerciseImage2,
                exerciseStep: widget.exerciseStep,
                numberUnit: widget.numberUnit,
                idx: i+1,
              ),
          ],
        ),
      ),
    );
  }
}
