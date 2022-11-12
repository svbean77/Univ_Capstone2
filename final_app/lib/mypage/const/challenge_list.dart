import 'package:flutter/material.dart';

import '../../screen/const/grade_colors.dart';

class ChallengeList extends StatelessWidget {
  final date;
  final weight;
  const ChallengeList({
    required this.weight,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int grade = 0;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${weight}Kg', style: TextStyle(fontSize: 20.0)),
          Text('${date.year}.${date.month}.${date.day}')
        ],
      ),

    );
  }
}
