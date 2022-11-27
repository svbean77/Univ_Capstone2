import 'package:final_app/ranking/const/ranking_card.dart';
import 'package:flutter/material.dart';

class AllRanking extends StatelessWidget {
  final loginID;
  const AllRanking({
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    select: 사용자 테마 선택
     */
    /*
    select: 모든 사용자 정보
     */
    int grade = 5;
    List<String> nickname = [
      '유저1',
      '유저2',
      '유저3',
      '유저4',
      '유저5',
      '유저6',
      '유저7',
      '유저8',
      '유저9'
    ];
    List<String> rating = [
      '챌린저',
      '그랜드마스터',
      '마스터',
      '다이아몬드',
      '플래티넘',
      '골드',
      '실버',
      '브론즈',
      '아이언'
    ];
    List<int> total3th = [450, 400, 350, 300, 250, 200, 150, 100, 50];

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
                loginID: loginID,
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
