
import 'package:appbar/screen/drawer.dart';
import 'package:appbar/screen/screen_a.dart';
import 'package:appbar/screen/screen_b.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(color: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '메인 페이지',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageA(),
                  ),
                );
              },
              child: Text('페이지 A로 이동'),
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
