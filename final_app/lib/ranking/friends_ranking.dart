import 'package:final_app/ranking/const/ranking_card.dart';
import 'package:flutter/material.dart';

class FriendsRanking extends StatelessWidget {
  const FriendsRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int grade = 5;
    List<String> nickname = ['친구1', '친구2', '친구3', '친구4','친구5'];
    List<String> rating = ['챌린저', '다이아몬드', '골드', '브론즈', '아이언'];
    List<int> total3th = [500, 380, 220, 190, 80];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return RankingCard(
                grade: grade,
                nickname: nickname[index],
                rating: rating[index],
                ranking: index + 1,
                total3th: total3th[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 8.0);
            },
            itemCount: nickname.length),
      ),
    );
  }
}
