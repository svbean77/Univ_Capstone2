import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final int grade;
  final String muscleName;
  final String exerciseName;
  final String equipment;
  final String exerciseImage1;
  final String exerciseImage2;
  final String exerciseStep;

  const ExerciseCard({
    required this.grade,
    required this.muscleName,
    required this.exerciseName,
    required this.equipment,
    required this.exerciseImage1,
    required this.exerciseImage2,
    required this.exerciseStep,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            exerciseImage1,
          ),
          SizedBox(height: 8.0),
          Image.network(
            exerciseImage2,
          ),
          SizedBox(height: 8.0),
          Text(
            exerciseName,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            exerciseStep,
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
