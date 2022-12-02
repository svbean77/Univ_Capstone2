import 'dart:convert';

import 'package:final_app/ranking/const/user_info.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/db_class.dart';
import '../../screen/const/ip_address.dart';
import '../friends_main.dart';

class FriendCard extends StatelessWidget {
  /*
  class로 넘겼다고 가정!
   */
  final loginID;
  final nickname;
  final rating;
  final grade;

  const FriendCard({
    required this.loginID,
    required this.nickname,
    required this.grade,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
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
                SizedBox(width: 8.0),
                Text(' $nickname', style: TextStyle(fontSize: 20.0)),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.person_search),
                    onTap: () async {
                      var url = Uri.http(IP_ADDRESS,
                          '/test_select_userdata.php', {'q': '{http}'});
                      var response =
                          await http.post(url, body: <String, String>{
                        "username": nickname.toString(),
                        "mode": "Nickname".toString(),
                      });
                      var jsondata =
                          jsonDecode(json.decode(json.encode(response.body)));
                      USERDATA data = USERDATA.fromJson(jsondata);

                      var url2 = Uri.http(IP_ADDRESS,
                          '/test_select_exercise_record.php', {'q': '{http}'});
                      var response2 =
                          await http.post(url2, body: <String, String>{
                        "nickname": nickname.toString(),
                      });
                      var jsondata2 =
                          jsonDecode(json.decode(json.encode(response2.body)));
                      MY_EXERCISE_RECORD data2 =
                          MY_EXERCISE_RECORD.fromJson(jsondata2);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => UserInfo(
                            loginID: loginID,
                            userdata: data.result!,
                            recorddata: data2.result!,
                            grade: grade,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    child: Icon(Icons.cancel_outlined),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 100.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('친구삭제 하시겠습니까?'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: PRIMARY_COLOR[grade],
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          '취소',
                                          style: TextStyle(
                                            color: (grade == 0 ||
                                                    grade == 1 ||
                                                    grade == 2 ||
                                                    grade == 4 ||
                                                    grade == 8)
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: PRIMARY_COLOR[grade],
                                          elevation: 0,
                                        ),
                                        onPressed: () async {
                                          var url = Uri.http(
                                              IP_ADDRESS,
                                              '/test_remove_friends.php',
                                              {'q': '{http}'});
                                          var response = await http
                                              .post(url, body: <String, String>{
                                            "nickname": loginID.toString(),
                                            "friends": nickname.toString(),
                                          });
                                          var jsondata = jsonDecode(json.decode(
                                              json.encode(response.body)));
                                          /*
                                          delete: db에 친구 삭제하는 코드
                                           */
                                          if (jsondata == "Success")
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
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
