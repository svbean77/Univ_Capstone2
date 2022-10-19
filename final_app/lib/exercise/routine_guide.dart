import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class RoutineGuide extends StatefulWidget {
  final int grade;
  const RoutineGuide({
    this.grade = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<RoutineGuide> createState() => _RoutineGuideState();
}

class _RoutineGuideState extends State<RoutineGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      body: Center(
        child: Text(
          '루틴 가이드 페이지',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
