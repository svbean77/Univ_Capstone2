import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  int grade = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(grade: grade),
      appBar: MyAppBar(grade: grade),
      body: Center(
        child: Text(
          '마이페이지',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
