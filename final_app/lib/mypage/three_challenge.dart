import 'package:final_app/mypage/my_page.dart';
import 'package:final_app/mypage/notice.dart';
import 'package:final_app/mypage/sign_in.dart';
import 'package:flutter/material.dart';

import '../screen/home_screen.dart';

class ThreeChallenge extends StatefulWidget {
  const ThreeChallenge({Key? key}) : super(key: key);

  @override
  State<ThreeChallenge> createState() => _ThreeChallengeState();
}

class _ThreeChallengeState extends State<ThreeChallenge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('득근득근'),
//backgroundColor: Colors.green,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ),
              );
            },
            child: Icon(Icons.home),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Center(
        child: Text(
          '3대 챌린지',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}