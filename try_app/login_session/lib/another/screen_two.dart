import 'package:flutter/material.dart';
import 'package:login_session/another/screen_one.dart';
import 'package:login_session/another/screen_three.dart';

import '../screen/const/after_login.dart';
import '../screen/const/storage_box.dart';
import '../screen/home_screen.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //로그인 해도, 안해도 볼 수 있음

    return Scaffold(
      appBar: AppBar(title: Text('세션유지')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'allUser',
            onPressed: () {
              //로그인 상관 없이 사용 가능
              print("모든 사용자 가능~");
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8.0),
          FloatingActionButton(
            heroTag: 'loginUser',
            onPressed: () {
              //로그인 해야 사용 가능
              if (LOGIN_BOX.read('id') != null)
                print("버튼을 열어줘~~~~");
              else
                print("버튼 사용 놉!!! 안돼!! 돌아가!!;");
            },
            child: Icon(Icons.cancel),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('페이지2', style: TextStyle(fontSize: 50.0)),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(),
                  ),
                );
              },
              child: Text('홈'),
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
