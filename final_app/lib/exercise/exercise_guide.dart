import 'package:final_app/screen/app_bar.dart';
import 'package:final_app/screen/drawer.dart';
import 'package:flutter/material.dart';
import 'exercise_card.dart';

class ExerciseGuide extends StatefulWidget {
  final int grade;
  final muscleName;
  final exerciseName;
  final equipment;
  final difficulty;
  final exerciseImage;
  final exerciseStep;

  const ExerciseGuide({
    this.grade = 0,
    required this.exerciseStep,
    required this.exerciseName,
    required this.exerciseImage,
    required this.equipment,
    required this.muscleName,
    required this.difficulty,
    Key? key,
  }) : super(key: key);

  @override
  State<ExerciseGuide> createState() => _ExerciseGuideState();
}

class _ExerciseGuideState extends State<ExerciseGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_list),
        onPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '초보자 ${widget.muscleName} 운동 가이드',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final muscleName = widget.muscleName;
                    final exerciseName = widget.exerciseName;
                    final equipment = widget.equipment;
                    final exerciseImage = widget.exerciseImage;
                    final exerciseStep = widget.exerciseStep;

                    return ExerciseCard(
                      grade: 1,
                      muscleName: muscleName,
                      exerciseName: exerciseName,
                      equipment: equipment,
                      exerciseImage: exerciseImage,
                      exerciseStep: exerciseStep,
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
