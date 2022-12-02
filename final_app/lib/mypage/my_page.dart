import 'dart:convert';

import 'package:final_app/mypage/edit_my_info.dart';
import 'package:final_app/ranking/const/my_ranking.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/const/db_class.dart';
import '../screen/const/grade_colors.dart';
import '../screen/const/ip_address.dart';
import '../screen/const/storage_box.dart';

class MyPage extends StatefulWidget {
  final loginID;
  int grade;

  MyPage({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Map<String, int> THEME_SELECT_RANGE = {
    '아이언': 1,
    '브론즈': 2,
    '실버': 3,
    '골드': 4,
    '플래티넘': 5,
    '다이아몬드': 6,
    '마스터': 7,
    '그랜드마스터': 8,
    '챌린저': 9
  };

  Future getDatas(String nickname) async {
    var url =
        Uri.http(IP_ADDRESS, '/test_select_userdata.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "username": widget.loginID.toString(),
      "mode": "Nickname".toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    USERDATA data = USERDATA.fromJson(jsondata);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    int? selectRange = 0;

    return FutureBuilder(
        future: getDatas(widget.loginID),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            selectRange = THEME_SELECT_RANGE[snapshot.data.result![0].rating];

          return Scaffold(
            drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
            appBar: MyAppBar(grade: widget.grade),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: snapshot.hasData
                  ? ListView(
                      children: [
                        MyRanking(
                            nickname: widget.loginID,
                            loginID: widget.loginID,
                            grade: widget.grade),
                        SizedBox(height: 16.0),
                        Text('앱 테마 선택', style: TextStyle(fontSize: 25.0)),
                        Container(
                          height: 70.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (int i = 0; i < selectRange!; i++)
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.grade = i;
                                      });
                                    },
                                    child: Icon(
                                      Icons.circle,
                                      size: 50.0,
                                      color: PRIMARY_COLOR[i],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            ElevatedButton(
                              onPressed: () async {
                                var url = Uri.http(IP_ADDRESS,
                                    '/test_change_theme.php', {'q': '{http}'});
                                var response =
                                    await http.post(url, body: <String, String>{
                                  "nickname": widget.loginID.toString(),
                                  "apptheme": widget.grade.toString(),
                                });
                                var jsondata = jsonDecode(
                                    json.decode(json.encode(response.body)));

                                if (jsondata == "Success")
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomeScreen(),
                                      ),
                                      (route) => false);
                              },
                              child: MyText(text: "테마 변경", grade: widget.grade),
                              style: ElevatedButton.styleFrom(
                                primary: PRIMARY_COLOR[widget.grade],
                                elevation: 0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => EditMyInfo(
                                  grade: widget.grade,
                                  username: snapshot.data.result![0].username,
                                  password: snapshot.data.result![0].password,
                                  nickname: snapshot.data.result![0].nickname,
                                  userage: snapshot.data.result![0].userage,
                                  sex: snapshot.data.result![0].sex == 'male'
                                      ? [true, false]
                                      : [false, true],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 50.0,
                            width: double.infinity,
                            child: Center(
                              child: Text('내 정보 수정',
                                  style: TextStyle(fontSize: 20.0)),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PRIMARY_COLOR[widget.grade],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    height: 100.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('로그아웃 하시겠습니까?'),
                                        SizedBox(height: 8.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: MyText(text: "취소", grade: widget.grade),
                                              style: ElevatedButton.styleFrom(
                                                  primary: PRIMARY_COLOR[
                                                      widget.grade],
                                                  elevation: 0),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                LOGIN_BOX.remove('id');
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              HomeScreen(),
                                                        ),
                                                        (route) => false);
                                              },
                                              child: MyText(text: "확인", grade: widget.grade),
                                              style: ElevatedButton.styleFrom(
                                                  primary: PRIMARY_COLOR[
                                                      widget.grade],
                                                  elevation: 0),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: MyText(text: "로그아웃", grade: widget.grade),
                          style: ElevatedButton.styleFrom(
                            primary: PRIMARY_COLOR[widget.grade],
                            elevation: 0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    height: 100.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('탈퇴 하시겠습니까?'),
                                        SizedBox(height: 8.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: MyText(
                                                  text: "취소",
                                                  grade: widget.grade),
                                              style: ElevatedButton.styleFrom(
                                                  primary: PRIMARY_COLOR[
                                                      widget.grade],
                                                  elevation: 0),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                var url = Uri.http(
                                                    IP_ADDRESS,
                                                    '/test_remove_user.php',
                                                    {'q': '{http}'});
                                                var response = await http.post(
                                                    url,
                                                    body: <String, String>{
                                                      "nickname":
                                                          widget.loginID,
                                                    });
                                                var jsondata = jsonDecode(
                                                    json.decode(json.encode(
                                                        response.body)));
                                                if (jsondata == 'Success') {
                                                  LOGIN_BOX.remove('id');
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                HomeScreen(),
                                                          ),
                                                          (route) => false);
                                                }
                                              },
                                              child: MyText(
                                                  text: "확인",
                                                  grade: widget.grade),
                                              style: ElevatedButton.styleFrom(
                                                  primary: PRIMARY_COLOR[
                                                      widget.grade],
                                                  elevation: 0),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            '회원탈퇴',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        });
  }
}
