import 'package:flutter/material.dart';
import 'package:login_session/another/screen_three.dart';
import 'package:login_session/another/screen_two.dart';
import 'package:login_session/screen/home_screen.dart';

import '../screen/const/after_login.dart';
import '../screen/const/storage_box.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //로그인 해도, 안해도 볼 수 있음!

    return Scaffold(
      appBar: AppBar(title: Text('세션유지')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('페이지1', style: TextStyle(fontSize: 50.0)),
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
