/*
*
*
*
페이지 삭제
*
*
*
 */




import 'package:flutter/material.dart';

import '../../screen/const/grade_colors.dart';

class ChallengeList extends StatelessWidget {
  final grade;
  final date;
  const ChallengeList({
    required this.grade,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      height: 70.0,
      width: double.infinity,
      grade: grade,
      child: Text(
        '${date[0]}.${date[1]}.${date[2]}',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
