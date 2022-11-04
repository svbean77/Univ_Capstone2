import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class RankingCard extends StatelessWidget {
  final nickname;
  final rating;
  final total3th;
  final ranking;

  const RankingCard({
    required this.nickname,
    required this.rating,
    required this.ranking,
    required this.total3th,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int grade = 0;

    return Container(
      width: double.infinity,
      height: 70.0,
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(
          color: PRIMARY_COLOR[grade],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('asset/images/ranking/$rating.png'),
              Text(' $ranking위 $nickname'),
            ],
          ),
          Text('$rating  ${total3th}kg'),
        ],
      ),
    );
  }
}
