import 'package:final_app/mypage/const/challenge_detail.dart';
import 'package:final_app/mypage/const/challenge_list.dart';
import 'package:final_app/mypage/const/writeChallenge.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class ChallengeMain extends StatelessWidget {
  final loginID;
  final exercise;
  final grade;

  const ChallengeMain({
    required this.exercise,
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    select: loginID의 exercise에 대한 기록 (내림차순)
     */

    List<int> num = [1, 4, 5];
    List<String> recordDate = ["20221010", "20220202", "20221111"];
    List<List<String>> date = [];

    for (int i = 0; i < recordDate.length; i++) {
      String year = (int.parse(recordDate[i]) ~/ 10000).toString();
      String month = ((int.parse(recordDate[i]) % 10000) ~/ 100).toString();
      if (month.length == 1) month = "0" + month;
      String day = (int.parse(recordDate[i]) % 100).toString();
      if (day.length == 1) day = "0" + day;

      date.add([year, month, day]);
    }

    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(loginID: loginID, grade: grade),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: PRIMARY_COLOR[grade],
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => WriteChallenge(
                exercise: exercise,
                loginID: loginID,
                grade: grade,
              ),
            ),
          );
        },
        child: Icon(Icons.create,
            color: (grade == 0 ||
                    grade == 1 ||
                    grade == 2 ||
                    grade == 4 ||
                    grade == 8)
                ? Colors.black
                : Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('${exercise} 챌린지 기록', style: TextStyle(fontSize: 25.0)),
            SizedBox(height: 16.0),
            for (int i = 0; i < date.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () {
                    /*
                    class로 전달 (사진 등도 다 가는거임, [i]로 전달하니까 하나씩)
                     */
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ChallengeDetail(
                          date: date[i],
                          exercise: exercise,
                          num: num[i],
                          loginID: loginID,
                          grade: grade,
                        ),
                      ),
                    );
                  },
                  child: ChallengeList(
                    grade: grade,
                    date: date[i],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
