import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  final int grade;
  const MyPage({
    this.grade = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      body: Center(
        child: Text(
          '마이페이지',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
