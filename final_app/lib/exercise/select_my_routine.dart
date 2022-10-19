import 'package:final_app/exercise/list_my_exercise.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class SelectMyRoutine extends StatefulWidget {
  final int grade;
  const SelectMyRoutine({
    this.grade = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<SelectMyRoutine> createState() => _SelectMyRoutineState();
}

class _SelectMyRoutineState extends State<SelectMyRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      body: Column(
        children: [
          Text('중상급자'),
          TextButton(
            onPressed: () {},
            child: Text('루틴 만들기'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext ccontext) => ListMyExercise(),
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
