import 'package:final_app/community/const/community_main.dart';
import 'package:final_app/mypage/my_page.dart';
import 'package:final_app/mypage/sign_in.dart';
import 'package:final_app/mypage/three_challenge.dart';
import 'package:final_app/screen/const/after_login.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:flutter/material.dart';

import '../../mypage/copyright_screen.dart';
import 'grade_colors.dart';

class MyDrawer extends StatelessWidget {
  final loginID;
  const MyDrawer({
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //로그인 id에 따른 닉네임 구하기
    int grade = 0;
    if (loginID != "") {
      grade = 5;
    }

    return Drawer(
      backgroundColor: PRIMARY_COLOR[grade],
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('asset/images/etc/mainImage.png', width: 100.0),
          ),
          Card(
            color: PRIMARY_COLOR[grade],
            elevation: 0,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (loginID == "")
                    Text(
                      '로그인',
                      style: TextStyle(
                          color: (grade == 0 ||
                                  grade == 1 ||
                                  grade == 2 ||
                                  grade == 4 ||
                                  grade == 8)
                              ? Colors.black
                              : Colors.white),
                    )
                  else
                    Text(
                      '마이페이지',
                      style: TextStyle(
                          color: (grade == 0 ||
                                  grade == 1 ||
                                  grade == 2 ||
                                  grade == 4 ||
                                  grade == 8)
                              ? Colors.black
                              : Colors.white),
                    ),
                ],
              ),
              onTap: () {
                if (loginID == "")
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => SignIn(),
                    ),
                  );
                else
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MyPage(loginID: loginID),
                    ),
                  );
              },
            ),
          ),
          Card(
            color: PRIMARY_COLOR[grade],
            child: ListTile(
              title: Text(
                '커뮤니티',
                style: TextStyle(
                    color: (grade == 0 ||
                            grade == 1 ||
                            grade == 2 ||
                            grade == 4 ||
                            grade == 8)
                        ? Colors.black
                        : Colors.white),
              ),
              onTap: () {
                if (loginID == '')
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Scaffold(
                        appBar: MyAppBar(grade: 0),
                        drawer: MyDrawer(loginID: ""),
                        body: AfterLogin(),
                      ),
                    ),
                  );
                else
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          CommunityMain(loginID: loginID),
                    ),
                  );
              },
            ),
            elevation: 0,
          ),
          Card(
            color: PRIMARY_COLOR[grade],
            child: ListTile(
              title: Text(
                '3대 챌린지',
                style: TextStyle(
                    color: (grade == 0 ||
                            grade == 1 ||
                            grade == 2 ||
                            grade == 4 ||
                            grade == 8)
                        ? Colors.black
                        : Colors.white),
              ),
              onTap: () {
                if (loginID == '')
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Scaffold(
                        appBar: MyAppBar(grade: 0),
                        drawer: MyDrawer(loginID: ""),
                        body: AfterLogin(),
                      ),
                    ),
                  );
                else
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ThreeChallenge(loginID: loginID),
                    ),
                  );
              },
            ),
            elevation: 0,
          ),
          Card(
            color: PRIMARY_COLOR[grade],
            child: ListTile(
              title: Text(
                '저작권출처',
                style: TextStyle(
                    color: (grade == 0 ||
                            grade == 1 ||
                            grade == 2 ||
                            grade == 4 ||
                            grade == 8)
                        ? Colors.black
                        : Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        CopyrightScreen(grade: grade),
                  ),
                );
              },
            ),
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
