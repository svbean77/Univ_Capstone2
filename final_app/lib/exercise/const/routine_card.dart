import 'package:flutter/material.dart';

class RoutineCard extends StatelessWidget {
  final String exerciseName;
  final String exerciseImage1;
  final String exerciseImage2;
  final String exerciseStep;
  final int number;
  final String numberUnit;

  const RoutineCard({
    required this.exerciseName,
    required this.number,
    required this.exerciseImage1,
    required this.exerciseImage2,
    required this.exerciseStep,
    required this.numberUnit,
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
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              '$exerciseName X$number$numberUnit',
              style: TextStyle(
                fontSize: 20.0,
              ),
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
