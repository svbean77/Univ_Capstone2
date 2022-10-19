import 'package:final_app/screen/app_bar.dart';
import 'package:final_app/screen/drawer.dart';
import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  final int grade;
  const Notice({
    this.grade = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(grade: widget.grade),
      body: Center(
        child: Text(
          '공지사항',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
