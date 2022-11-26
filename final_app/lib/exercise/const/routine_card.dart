import 'package:flutter/material.dart';

class RoutineCard extends StatelessWidget {
  final String exerciseName;
  final String exerciseImage1;
  final String exerciseImage2;
  final String exerciseStep;
  final int number;
  final String numberUnit;
  final idx;

  const RoutineCard({
    required this.exerciseName,
    required this.number,
    required this.exerciseImage1,
    required this.exerciseImage2,
    required this.exerciseStep,
    required this.numberUnit,
    required this.idx,
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
            '$idx. $exerciseName',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Text('X$number$numberUnit'),
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
