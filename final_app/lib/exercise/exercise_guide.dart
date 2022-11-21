import 'package:final_app/exercise/const/equipment_filter.dart';
import 'package:final_app/exercise/select_body.dart';
import 'package:final_app/exercise/select_muscle.dart';
import 'package:final_app/record/const/add_record.dart';
import 'package:final_app/record/record_calendar.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';
import '../screen/const/grade_colors.dart';
import 'const/exercise_card.dart';

class ExerciseGuide extends StatefulWidget {
  final loginID;
  final String level;
  final muscleName;
  final exerciseName;
  final equipment;
  final difficulty;
  final exerciseImage1;
  final exerciseImage2;
  final exerciseStep;

  const ExerciseGuide({
    required this.loginID,
    required this.level,
    required this.exerciseStep,
    required this.exerciseName,
    required this.exerciseImage1,
    required this.difficulty,
    required this.exerciseImage2,
    required this.equipment,
    required this.muscleName,
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseGuide> createState() => _ExerciseGuideState();
}

class _ExerciseGuideState extends State<ExerciseGuide> {
  @override
  Widget build(BuildContext context) {
    int grade = 0;
    if (widget.loginID != "") grade = 5;


    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID),
      appBar: MyAppBar(grade: grade),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
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
              if (widget.loginID == '')
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        height: 100.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('로그인 후 사용 가능합니다'),
                            SizedBox(height: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('확인',
                                  style: TextStyle(color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey[200], elevation: 0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              else
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
            backgroundColor: PRIMARY_COLOR[grade],
          ),
          SizedBox(height: 8.0),
          FloatingActionButton(
            heroTag: 'filter',
            child: Icon(Icons.filter_list_alt,
                color: (grade == 0 ||
                        grade == 1 ||
                        grade == 2 ||
                        grade == 4 ||
                        grade == 8)
                    ? Colors.black
                    : Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) {
                  return EquipmentFilter(
                    level: widget.level,
                    exerciseImage2: widget.exerciseImage2,
                    muscleName: widget.muscleName,
                    exerciseStep: widget.exerciseStep,
                    equipment: widget.equipment,
                    difficulty: widget.difficulty,
                    exerciseName: widget.exerciseName,
                    exerciseImage1: widget.exerciseImage1,
                    loginID: widget.loginID,
                  );
                },
              );
            },
            backgroundColor: PRIMARY_COLOR[grade],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.level} ${widget.muscleName} 운동 가이드\n> ${widget.equipment}',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR[grade],
              ),
              onPressed: () {
                if (widget.level == '초보자')
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          SelectBody(loginID: widget.loginID),
                    ),
                  );
                else
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          SelectMuscle(loginID: widget.loginID),
                    ),
                  );
              },
              child: Text(
                '근육 선택',
                style: TextStyle(
                  color: (grade == 0 ||
                          grade == 1 ||
                          grade == 2 ||
                          grade == 4 ||
                          grade == 8)
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final muscleName = widget.muscleName;
                    final exerciseName = widget.exerciseName;
                    final equipment = widget.equipment;
                    final exerciseImage1 = widget.exerciseImage1;
                    final exerciseImage2 = widget.exerciseImage2;
                    final exerciseStep = widget.exerciseStep;

                    return ExerciseCard(
                      grade: 1,
                      muscleName: muscleName,
                      exerciseName: exerciseName,
                      equipment: equipment,
                      exerciseImage1: exerciseImage1,
                      exerciseImage2: exerciseImage2,
                      exerciseStep: exerciseStep,
                      difficulty: widget.difficulty,
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
