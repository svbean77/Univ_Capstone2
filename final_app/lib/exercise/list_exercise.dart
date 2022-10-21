import 'package:final_app/exercise/routine_guide.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class ListExercise extends StatefulWidget {
  final int grade;
  final title;
  const ListExercise({
    this.grade = 0,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<ListExercise> createState() => _ListExerciseState();
}

class _ListExerciseState extends State<ListExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      body: Column(
        children: [
          Text('선택한 루틴 이름'),
          Row(
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
          Row(
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
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RoutineGuide(),
                ),
              );
            },
            child: Text('운동 시작'),
          ),
        ],
      ),
    );
  }
}
