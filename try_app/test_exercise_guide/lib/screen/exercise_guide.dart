import 'package:flutter/material.dart';
import 'package:test_exercise_guide/screen/select_muscle.dart';

import '../const/equipment_filter.dart';
import '../const/exercise_card.dart';
import 'home_screen.dart';

class ExerciseGuide extends StatefulWidget {
  final level; //초보자, 숙련자
  final muscleName;
  final exerciseName;
  final equipment;
  final difficulty; //운동 난이도
  final exerciseImage1;
  final exerciseImage2;
  final exerciseStep;

  const ExerciseGuide({
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
              );
            },
            child: Icon(Icons.home),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 8.0),
          FloatingActionButton(
            elevation: 0,
            heroTag: 'filter',
            child: Icon(Icons.filter_list_alt),
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
                  );
                },
              );
            },
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
                elevation: 0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        SelectMuscle(level: widget.level),
                  ),
                );
              },
              child: Text('근육 선택'),
            ),
            SizedBox(height: 16.0),
            if (widget.exerciseName.length == 0)
              Center(
                child: Text('운동이 없습니다.'),
              )
            else
              for (int i = 0; i < widget.exerciseName.length; i++)
                ExerciseGuide(
                    level: widget.level,
                    exerciseStep: widget.exerciseStep[i],
                    exerciseName: widget.exerciseName[i],
                    exerciseImage1: widget.exerciseImage1[i],
                    difficulty: widget.difficulty[i],
                    exerciseImage2: widget.exerciseImage2[i],
                    equipment: widget.equipment,
                    muscleName: widget.muscleName),
          ],
        ),
      ),
    );
  }
}
