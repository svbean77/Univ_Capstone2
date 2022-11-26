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

    return Container(
      height: 70.0,
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: PRIMARY_COLOR[grade],
        ),
      ),
      child: Text('${date.year}.${date.month}.${date.day}', style: TextStyle(fontSize: 20.0)),

    );
  }
}
