import 'package:final_app/exercise/select_muscle.dart';
import 'package:final_app/exercise/select_my_routine.dart';
import 'package:final_app/exercise/select_routine.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

import '../screen/const/after_login.dart';
import '../screen/const/app_bar.dart';
import '../screen/const/drawer.dart';

class MasterMain extends StatelessWidget {
  final loginID;
  const MasterMain({
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int grade = 0;
    if (loginID != "") grade = 5;

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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    SelectMuscle(loginID: loginID),
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
              '근육 부위별 운동',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext ccontext) => loginID == ""
                    ? Scaffold(
                        appBar: MyAppBar(grade: grade),
                        drawer: MyDrawer(loginID: loginID),
                        body: AfterLogin(),
                      )
                    : SelectRoutine(loginID: loginID),
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
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext ccontext) => loginID == ""
                    ? Scaffold(
                        appBar: MyAppBar(grade: grade),
                        drawer: MyDrawer(loginID: loginID),
                        body: AfterLogin(),
                      )
                    : SelectMyRoutine(loginID: loginID),
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
              '내 루틴 만들기',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
  }
}
