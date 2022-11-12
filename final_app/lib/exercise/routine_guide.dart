import 'package:final_app/exercise/const/routine_card.dart';
import 'package:final_app/record/record_calendar.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

class RoutineGuide extends StatefulWidget {
  final int grade;
  final routineName;
  final exerciseName;
  final exerciseImage1;
  final exerciseImage2;
  final exerciseStep;
  final number;
  final numberUnit;

  const RoutineGuide({
    this.grade = 0,
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
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      floatingActionButton: FloatingActionButton(
        heroTag: 'memo',
        child: Icon(Icons.note_add_outlined),
        onPressed: () {
          String content =
              '''아\n주\n긴\n내\n용\n아\n주\n긴\n내\n용\n아\n주\n긴\n내\n용\n아\n주\n긴\n내\n용\n''';
          String mode;
          if (content.length == 0) {
            mode = 'insert';
          } else {
            mode = 'edit';
          }
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return RecordBottomSheet(
                  selectedDay: DateTime.now(),
                  content: content,
                  mode: mode,
                  grade: widget.grade);
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
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(),
                  ),
                  (route) => false,
                );
              },
              child: Text(
                '운동종료',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
