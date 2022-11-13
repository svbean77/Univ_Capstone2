import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  const Notice({
    Key? key,
  }) : super(key: key);

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  int grade = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: grade),
      body: Center(
        child: Text(
          '공지사항',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
