import 'package:flutter/material.dart';
import 'package:login_session/another/screen_one.dart';
import 'package:login_session/another/screen_three.dart';
import 'package:login_session/another/screen_two.dart';
import 'package:login_session/screen/const/after_login.dart';
import 'package:login_session/screen/const/storage_box.dart';
import 'package:login_session/screen/sign_in.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('세션유지')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('홈화면', style: TextStyle(fontSize: 50.0)),
            //로그인 상태라면 로그아웃 버튼, 아니면 로그인 버튼으로 변경 + 이동

            if (LOGIN_BOX.read('id') != null)
              Column(
                children: [
                  Text('현재 로그인 아이디: ${LOGIN_BOX.read('id')}'),
                  ElevatedButton(
                    onPressed: () {
                      print("박스에 있음: ${LOGIN_BOX.read('id')}");
                      LOGIN_BOX.remove('id');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Text('로그아웃'),
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => SignIn(),
                    ),
                  );
                },
                child: Text('로그인'),
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageOne(),
                  ),
                );
              },
              child: Text('페이지1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageTwo(),
                  ),
                );
              },
              child: Text('페이지2'),
            ),
            ElevatedButton(
              onPressed: () {
                if (LOGIN_BOX.read('id') != null)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PageThree(),
                    ),
                  );
                else
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => AfterLogin(),
                    ),
                  );
              },
              child: Text('페이지3'),
            ),
          ],
        ),
      ),
    );
  }
}
