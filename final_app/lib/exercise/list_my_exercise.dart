import 'package:final_app/exercise/routine_guide.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class ListMyExercise extends StatefulWidget {
  final int grade;
  const ListMyExercise({
    this.grade = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<ListMyExercise> createState() => _ListMyExerciseState();
}

class _ListMyExerciseState extends State<ListMyExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('선택한 루틴 이름'),
              Icon(Icons.add),
            ],
          ),
          SizedBox(height: 30.0),
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
              /*
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RoutineGuide(),
                ),
              );

               */
            },
            child: Text('운동 시작'),
          ),
        ],
      ),
    );
  }
}
