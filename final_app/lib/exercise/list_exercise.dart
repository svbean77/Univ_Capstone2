import 'package:final_app/exercise/routine_guide.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class ListExercise extends StatefulWidget {
  final loginID;
  final data;
  final grade;
  const ListExercise({
    required this.loginID,
    required this.data,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<ListExercise> createState() => _ListExerciseState();
}

class _ListExerciseState extends State<ListExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        loginID: widget.loginID,
        grade: widget.grade,
      ),
      appBar: MyAppBar(grade: widget.grade),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    widget.data[0].routine,
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(height: 16.0),
                  for (int i = 0; i < widget.data.length; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        width: double.infinity,
                        height: 70.0,
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PRIMARY_COLOR[widget.grade],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data[i].exercise,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(widget.data[i].num),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR[widget.grade],
                elevation: 0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => RoutineGuide(
                      data: widget.data,
                      loginID: widget.loginID,
                      grade: widget.grade,
                    ),
                  ),
                );
              },
              child: MyText(text: "운동 시작", grade: widget.grade),
            ),
          ],
        ),
      ),
    );
  }
}
