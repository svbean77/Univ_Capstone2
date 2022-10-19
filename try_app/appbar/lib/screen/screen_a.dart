import 'package:appbar/screen/appbar.dart';
import 'package:appbar/screen/drawer.dart';
import 'package:appbar/screen/home_screen.dart';
import 'package:appbar/screen/screen_b.dart';
import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(color: 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '페이지 A',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(),
                  ),
                );
              },
              child: Text('홈으로 이동'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageB(),
                  ),
                );
              },
              child: Text('페이지 B로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
