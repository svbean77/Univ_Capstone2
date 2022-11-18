import 'package:flutter/material.dart';
import 'package:login_session/another/screen_one.dart';
import 'package:login_session/another/screen_two.dart';

import '../screen/home_screen.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //로그인 해야 접근 가능

    return Scaffold(
      appBar: AppBar(title: Text('세션유지')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('페이지3', style: TextStyle(fontSize: 50.0)),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageTwo(),
                  ),
                );
              },
              child: Text('페이지2'),
            ),
          ],
        ),
      ),
    );
  }
}
