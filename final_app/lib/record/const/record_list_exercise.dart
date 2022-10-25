import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class RecordListExercise extends StatefulWidget {
  final exerciseName;
  final isTime;
  final exerciseNumber;
  const RecordListExercise({
    required this.exerciseNumber,
    required this.exerciseName,
    required this.isTime,
    Key? key,
  }) : super(key: key);

  @override
  State<RecordListExercise> createState() => _RecordListExerciseState();
}

class _RecordListExerciseState extends State<RecordListExercise> {
  int grade = 0;

  @override
  Widget build(BuildContext context) {
    int grade = 0;

    String numberUnit(String boolean) {
      String unit = (boolean == 't') ? '초' : '회';

      return unit;
    }

    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: grade),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '${widget.exerciseNumber.length}종류의 운동',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 30.0),
            for (int i = 0; i < widget.exerciseName.length; i++)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  height: 70.0,
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PRIMARY_COLOR[grade],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.exerciseName[i],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Text('${widget.exerciseNumber[i].toString()}${numberUnit(widget.isTime[i])}'),
                    ],
                  ),
                ),
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}
