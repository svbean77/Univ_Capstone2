import 'package:final_app/community/const/community_main.dart';
import 'package:final_app/friends/friends_main.dart';
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
  final grade;
  const MyDrawer({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    MyText(text: '로그인', grade: grade)
                  else
                    MyText(text: '마이페이지', grade: grade),
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
                          MyPage(loginID: loginID, grade: grade),
                    ),
                  );
              },
            ),
          ),
          Card(
            color: PRIMARY_COLOR[grade],
            child: ListTile(
              title: MyText(text: '3대챌린지', grade: grade),
              onTap: () {
                if (loginID == '')
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Scaffold(
                        appBar: MyAppBar(grade: 0),
                        drawer: MyDrawer(loginID: "", grade: grade),
                        body: AfterLogin(),
                      ),
                    ),
                  );
                else
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ThreeChallenge(loginID: loginID, grade: grade),
                    ),
                  );
              },
            ),
            elevation: 0,
          ),
          Card(
            color: PRIMARY_COLOR[grade],
            child: ListTile(
              title: MyText(text: '커뮤니티', grade: grade),
              onTap: () {
                if (loginID == '')
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Scaffold(
                        appBar: MyAppBar(grade: 0),
                        drawer: MyDrawer(loginID: "", grade: grade),
                        body: AfterLogin(),
                      ),
                    ),
                  );
                else
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          CommunityMain(loginID: loginID, grade: grade),
                    ),
                  );
              },
            ),
            elevation: 0,
          ),
          Card(
            color: PRIMARY_COLOR[grade],
            child: ListTile(
              title: MyText(text: '저작권출처', grade: grade),
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
