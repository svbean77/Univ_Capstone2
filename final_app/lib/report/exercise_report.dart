import 'package:flutter/material.dart';

class ExerciseReport extends StatefulWidget {
  const ExerciseReport({Key? key}) : super(key: key);

  @override
  State<ExerciseReport> createState() => _ExerciseReportState();
}

class _ExerciseReportState extends State<ExerciseReport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '운동 기록 페이지',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
