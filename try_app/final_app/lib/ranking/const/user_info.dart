import 'package:final_app/ranking/const/my_ranking.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final loginID;
  final nickname;
  final grade;

  const UserInfo({
    required this.loginID,
    required this.nickname,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    select: select의 운동기록 내림차순 (최신이 앞에) -> class
     */
    List<int> tmp = [20220901, 20220904, 20221010, 20221111];
    List<DateTime> date = [];

    for (int i = 0; i < tmp.length; i++) {
      int year = tmp[i] ~/ 10000;
      int month = (tmp[i] % 10000) ~/ 100;
      int day = tmp[i] % 100;
      date.add(DateTime(year, month, day));
    }
    List<String> memo = ['첫번째내용', '두\n번\n째\n내\n용\n!', '세\n번째\n내용', '네번째'];

    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(loginID: loginID, grade: grade),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyRanking(nickname: nickname, loginID: loginID),
            SizedBox(height: 8.0),
            Text('운동기록', style: TextStyle(fontSize: 25.0)),
            SizedBox(height: 8.0),
            Expanded(
              child: tmp.length == 0
                  ? Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PRIMARY_COLOR[grade],
                        ),
                      ),
                      child:
                          Text('운동 기록이 없습니다', style: TextStyle(fontSize: 20.0)),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: [
                          for (int i = 0; i < date.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Column(
                                          children: [
                                            Container(
                                              height: 200.0,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: PRIMARY_COLOR[grade],
                                                ),
                                              ),
                                              child: Text(memo[i]),
                                            ),
                                            SizedBox(height: 8.0),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: PRIMARY_COLOR[grade],
                                                elevation: 0,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                '확인',
                                                style: TextStyle(
                                                    color: (grade == 0 ||
                                                            grade == 1 ||
                                                            grade == 2 ||
                                                            grade == 4 ||
                                                            grade == 8)
                                                        ? Colors.black
                                                        : Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                        scrollable: true,
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 70.0,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: PRIMARY_COLOR[grade]),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                          '${date[i].year}.${date[i].month}.${date[i].day}',
                                          style: TextStyle(fontSize: 15.0)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
