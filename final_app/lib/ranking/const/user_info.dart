import 'package:final_app/ranking/const/my_ranking.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final loginID;
  final userdata;
  final recorddata;
  final grade;

  const UserInfo({
    required this.loginID,
    required this.userdata,
    required this.recorddata,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(grade: grade),
      drawer: MyDrawer(loginID: loginID, grade: grade),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyRanking(
              nickname: userdata[0].nickname, loginID: loginID, grade: grade),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text('운동기록', style: TextStyle(fontSize: 25.0)),
          ),
          Expanded(
            child: recorddata.length == 0
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PRIMARY_COLOR[grade],
                        ),
                      ),
                      child:
                          Text('운동 기록이 없습니다', style: TextStyle(fontSize: 20.0)),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: [
                          for (int i = 0; i < recorddata.length; i++)
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
                                              child:
                                                  Text(recorddata[i].comment),
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
                                              child: MyText(text: "확인", grade: grade),
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
                                          '${recorddata[i].writeDate.substring(0, 4)}.${recorddata[i].writeDate.substring(4, 6)}.${recorddata[i].writeDate.substring(6, 8)}',
                                          style: TextStyle(fontSize: 15.0)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
