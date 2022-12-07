import 'package:flutter/material.dart';

import '../../screen/const/grade_colors.dart';

class RoutineCard extends StatelessWidget {
  final exerciseName;
  final exerciseImage1;
  final exerciseImage2;
  final exerciseStep;
  final number;
  final idx;
  final grade;

  const RoutineCard({
    required this.exerciseName,
    required this.number,
    required this.exerciseImage1,
    required this.exerciseImage2,
    required this.exerciseStep,
    required this.idx,
    required this.grade,
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
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text('X $number',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 16.0),
          Container(
            //color: Colors.grey,
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: PRIMARY_COLOR[grade].withOpacity(0.5),
              ),
              color: Colors.white,
            ),
            child: IntrinsicHeight(
              child: Text(exerciseStep.replaceAll("@", "\n\n"),
                  style: TextStyle(fontSize: 18.0)),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
