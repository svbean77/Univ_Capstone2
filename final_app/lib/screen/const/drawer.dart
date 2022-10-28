import 'package:final_app/mypage/my_page.dart';
import 'package:final_app/mypage/notice.dart';
import 'package:final_app/mypage/sign_in.dart';
import 'package:final_app/mypage/three_challenge.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SignIn(),
                ),
              );
            },
            child: DrawerHeader(
              child: Text('프로필사진 크게'),
            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('닉네임'),
                  Text('등급'),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyPage(),
                  ),
                );
              },
            ),
          ),
          /*
          Card(
            elevation: 0,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('수분섭취'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.coffee),
                      Text('nn컵 / mm컵'),
                      TextButton(
                        child: Text('+1컵'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          */
          Card(
            child: ListTile(
              title: Text('3대 챌린지'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ThreeChallenge(),
                  ),
                );
              },
            ),
            elevation: 0,
          ),
          /*
          Card(
            child: ListTile(
              title: Text('공지사항'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Notice(),
                  ),
                );
              },
            ),
            elevation: 0,
          ),
           */
        ],
      ),
    );
  }
}
