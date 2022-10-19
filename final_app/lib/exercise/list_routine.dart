import 'package:final_app/exercise/list_exercise.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class ListRoutine extends StatefulWidget {
  final int grade;
  const ListRoutine({
    this.grade = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<ListRoutine> createState() => _ListRoutineState();
}

class _ListRoutineState extends State<ListRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('@@으로 루틴 선택 > @@'),
          SizedBox(height: 30.0),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ListExercise(),
                ),
              );
            },
            child: Row(
              children: [
                Container(
                  height: 50.0,
                  width: 100.0,
                  child: Text('@@운동'),
                ),
                Container(
                  height: 50.0,
                  width: 150.0,
                  child: Text('간단한 설명'),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ListExercise(),
                ),
              );
            },
            child: Row(
              children: [
                Container(
                  height: 50.0,
                  width: 100.0,
                  child: Text('@@운동'),
                ),
                Container(
                  height: 50.0,
                  width: 150.0,
                  child: Text('간단한 설명'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
