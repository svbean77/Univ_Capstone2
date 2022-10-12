import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final int grade;
  final String muscleName;
  final String exerciseName;
  final String equipment;
  final String exerciseImage;
  final String exerciseStep;

  const ExerciseCard({
    required this.grade,
    required this.muscleName,
    required this.exerciseName,
    required this.equipment,
    required this.exerciseImage,
    required this.exerciseStep,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            exerciseImage,
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
        ],
      ),
    );
  }
}
