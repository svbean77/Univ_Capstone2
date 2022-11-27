import 'dart:convert';

import 'package:final_app/exercise/select_muscle.dart';
import 'package:final_app/exercise/select_routine.dart';
import 'package:final_app/screen/const/after_login.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/const/db_class.dart';
import '../screen/const/ip_address.dart';

class BeginnerMain extends StatelessWidget {
  final loginID;
  final grade;
  const BeginnerMain({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '원하는 운동 방법을 \n선택해주세요',
          style: TextStyle(fontSize: 25.0),
          textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => SelectMuscle(
                loginID: loginID,
                level: '초보자',
                grade: grade,
              ),
            ));
          },
          child: Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 1.3,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
            child: Text(
              '근육 부위별 운동',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => loginID == ""
                    ? Scaffold(
                        appBar: MyAppBar(grade: grade),
                        drawer: MyDrawer(
                          loginID: loginID,
                          grade: grade,
                        ),
                        body: AfterLogin(),
                      )
                    : SelectRoutine(loginID: loginID, grade: grade),
              ),
            );
          },
          child: Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 1.3,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
            child: Text(
              '루틴',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
  }
}
