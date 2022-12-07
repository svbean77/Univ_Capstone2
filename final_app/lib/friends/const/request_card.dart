import 'dart:convert';

import 'package:final_app/friends/friends_main.dart';
import 'package:final_app/ranking/const/user_info.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/db_class.dart';
import '../../screen/const/ip_address.dart';

class RequestCard extends StatelessWidget {
  final loginID;
  final nickname;
  final rating;
  final grade;

  const RequestCard({
    required this.loginID,
    required this.grade,
    required this.nickname,
    required this.rating,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 70.0,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: PRIMARY_COLOR[grade].withOpacity(0.5),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('asset/images/ranking/$rating.png'),
                Text(' $nickname',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.person_search),
                    onTap: () async {
                      var url = Uri.parse(
                          "http://${IP_ADDRESS}/test_select_userdata.php");
                      /*
                      var url = Uri.http(IP_ADDRESS,
                          '/test_select_userdata.php', {'q': '{http}'});

                       */
                      var response =
                          await http.post(url, body: <String, String>{
                        "username": nickname.toString(),
                        "mode": "Nickname".toString(),
                      });
                      var jsondata =
                          jsonDecode(json.decode(json.encode(response.body)));
                      USERDATA data = USERDATA.fromJson(jsondata);

                      var url2 = Uri.parse(
                          "http://${IP_ADDRESS}/test_select_exercise_record.php");
                      /*
                      var url2 = Uri.http(IP_ADDRESS,
                          '/test_select_exercise_record.php', {'q': '{http}'});

                       */
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
                    child: Icon(Icons.add_circle_outline),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('친구 추가하시겠습니까?',
                                      style: TextStyle(fontSize: 18.0)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: PRIMARY_COLOR[grade],
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: MyText(text: "취소", grade: grade),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: PRIMARY_COLOR[grade],
                                          elevation: 0,
                                        ),
                                        onPressed: () async {
                                          var url = Uri.parse(
                                              "http://${IP_ADDRESS}/test_remove_request.php");
                                          /*
                                          var url = Uri.http(
                                              IP_ADDRESS,
                                              '/test_remove_request.php',
                                              {'q': '{http}'});

                                           */
                                          var response = await http
                                              .post(url, body: <String, String>{
                                            "nickname": loginID.toString(),
                                            "request": nickname.toString(),
                                          });
                                          var jsondata = json.decode(
                                              json.encode(response.body));

                                          var url2 = Uri.parse(
                                              "http://${IP_ADDRESS}/test_add_friends.php");
                                          /*
                                          var url2 = Uri.http(
                                              IP_ADDRESS,
                                              '/test_add_friends.php',
                                              {'q': '{http}'});

                                           */
                                          var response2 = await http.post(url2,
                                              body: <String, String>{
                                                "nickname": loginID.toString(),
                                                "request": nickname.toString(),
                                              });
                                          var jsondata2 = json.decode(
                                              json.encode(response2.body));

                                          if (jsondata.toString() ==
                                                  "Success" &&
                                              jsondata2.toString() ==
                                                  "Success") {
                                            MyToast(
                                                '친구 요청을 수락했습니다.',
                                                PRIMARY_COLOR[grade],
                                                (grade == 0 ||
                                                        grade == 1 ||
                                                        grade == 2 ||
                                                        grade == 4 ||
                                                        grade == 8)
                                                    ? Colors.black
                                                    : Colors.white);
                                            Navigator.of(context).pop();
                                          }
                                          //Navigator.of(context).pop();
                                        },
                                        child: MyText(text: "확인", grade: grade),
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
                              width: MediaQuery.of(context).size.width / 2,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('요청 삭제하시겠습니까?',
                                      style: TextStyle(fontSize: 18.0)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: PRIMARY_COLOR[grade],
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: MyText(text: "취소", grade: grade),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: PRIMARY_COLOR[grade],
                                          elevation: 0,
                                        ),
                                        onPressed: () async {
                                          var url = Uri.parse(
                                              "http://${IP_ADDRESS}/test_remove_request.php");
                                          /*
                                          var url = Uri.http(
                                              IP_ADDRESS,
                                              '/test_remove_request.php',
                                              {'q': '{http}'});

                                           */
                                          var response = await http
                                              .post(url, body: <String, String>{
                                            "nickname": loginID.toString(),
                                            "request": nickname.toString(),
                                          });
                                          var jsondata = json.decode(
                                              json.encode(response.body));
                                          if (jsondata == "Success") {
                                            MyToast(
                                                '친구 요청을 삭제했습니다.',
                                                PRIMARY_COLOR[grade],
                                                (grade == 0 ||
                                                        grade == 1 ||
                                                        grade == 2 ||
                                                        grade == 4 ||
                                                        grade == 8)
                                                    ? Colors.black
                                                    : Colors.white);
                                            Navigator.of(context).pop();
                                          }
                                          //Navigator.of(context).pop();
                                        },
                                        child: MyText(text: "확인", grade: grade),
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
