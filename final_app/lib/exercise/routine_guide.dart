import 'package:final_app/exercise/const/routine_card.dart';
import 'package:final_app/record/const/add_record.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class RoutineGuide extends StatefulWidget {
  final loginID;
  final data;
  final grade;

  const RoutineGuide({
    required this.loginID,
    required this.data,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<RoutineGuide> createState() => _RoutineGuideState();
}

class _RoutineGuideState extends State<RoutineGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      appBar: MyAppBar(grade: widget.grade),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: PRIMARY_COLOR[widget.grade],
        heroTag: 'memo',
        child: Icon(Icons.edit_calendar,
            color: (widget.grade == 0 ||
                    widget.grade == 1 ||
                    widget.grade == 2 ||
                    widget.grade == 4 ||
                    widget.grade == 8)
                ? Colors.black
                : Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: AddRecord(
                    grade: widget.grade,
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
        child: widget.data.length != 0
            ? ListView(
                children: [
                  Text(
                    '${widget.data[0].routine}',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  for (int i = 0; i < widget.data.length; i++)
                    RoutineCard(
                      exerciseName: widget.data[i].exercise,
                      number: widget.data[i].num,
                      exerciseImage1: widget.data[i].image1,
                      exerciseImage2: widget.data[i].image2,
                      exerciseStep: widget.data[i].step,
                      idx: i + 1,
                    ),
                  SizedBox(height: 60.0),
                ],
              )
            : Center(
                child: Text('운동이 없습니다.', style: TextStyle(fontSize: 18.0)),
              ),
      ),
    );
  }
}
