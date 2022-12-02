import 'package:final_app/mypage/const/challenge_main.dart';
import 'package:final_app/ranking/const/my_ranking.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

import '../screen/const/drawer.dart';

class ThreeChallenge extends StatefulWidget {
  final loginID;
  final grade;
  const ThreeChallenge({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<ThreeChallenge> createState() => _ThreeChallengeState();
}

class _ThreeChallengeState extends State<ThreeChallenge> {
  @override
  Widget build(BuildContext context) {
    List<String> three = ['데드리프트', '벤치프레스', '스쿼트'];

    return Scaffold(
      appBar: MyAppBar(grade: widget.grade),
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      body: Column(
        children: [
          MyRanking(
              nickname: widget.loginID,
              loginID: widget.loginID,
              grade: widget.grade),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => ChallengeMain(
                                exercise: three[i],
                                loginID: widget.loginID,
                                grade: widget.grade,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.centerLeft,
                          height: 100.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PRIMARY_COLOR[widget.grade],
                            ),
                          ),
                          child: Text(three[i], style: TextStyle(fontSize: 20.0)),
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
