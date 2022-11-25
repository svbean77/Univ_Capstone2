import 'package:flutter/material.dart';
import 'package:test_exercise_guide/screen/home_screen.dart';
import 'package:test_exercise_guide/screen/select_muscle.dart';
import 'package:test_exercise_guide/screen/test_screen.dart';

void main() {

  runApp(
    MaterialApp(
      home: SelectMuscle(level: '초보자'),
    ),
  );
}
