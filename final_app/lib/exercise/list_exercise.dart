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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data[0].routine,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  for (int i = 0; i < widget.data.length; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        height: 80.0,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: PRIMARY_COLOR[widget.grade].withOpacity(0.5),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${i + 1}. ${widget.data[i].exercise}',
                              style: TextStyle(fontSize: 23.0),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.0),
                            Text('X${widget.data[i].num}',
                                style: TextStyle(fontSize: 18.0)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10.0),
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
                SizedBox(width: 10.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
