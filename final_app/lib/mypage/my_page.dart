import 'package:final_app/mypage/edit_my_info.dart';
import 'package:final_app/ranking/const/my_ranking.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

import '../screen/const/grade_colors.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int grade = 0;

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

  @override
  Widget build(BuildContext context) {
    String nickname = '내닉네임';
    String id = 'myID';
    String rating = "챌린저";
    int? selectRange = THEME_SELECT_RANGE[rating];

    return Scaffold(
      drawer: MyDrawer(grade: grade),
      appBar: MyAppBar(grade: grade),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MyRanking(nickname: nickname),
            SizedBox(height: 16.0),
            Text('앱 테마 선택', style: TextStyle(fontSize: 20.0)),
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
                            grade = i;
                          });
                          //db에 선택 테마 인덱스를 바꾸는 코드
                          print(grade);
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
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => EditMyInfo(id: id),
                  ),
                );
              },
              child: Container(
                height: 50.0,
                width: double.infinity,
                child: Center(
                  child: Text('내 정보 수정', style: TextStyle(fontSize: 20.0)),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: PRIMARY_COLOR[grade],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
