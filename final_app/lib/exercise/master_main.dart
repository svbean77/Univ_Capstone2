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
  final grade;
  const MasterMain({
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
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => loginID == ""
                        ? Scaffold(
                            appBar: MyAppBar(grade: grade),
                            drawer: MyDrawer(loginID: loginID, grade: grade),
                            body: AfterLogin(),
                          )
                        : SelectMuscle(
                            loginID: loginID,
                            level: '숙련자',
                            grade: grade,
                          ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "asset/images/etc/exercise.png",
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  SizedBox(height: 8.0),
                  Text("부위별 운동", style: TextStyle(fontSize: 23.0)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext ccontext) => loginID == ""
                        ? Scaffold(
                            appBar: MyAppBar(grade: grade),
                            drawer: MyDrawer(loginID: loginID, grade: grade),
                            body: AfterLogin(),
                          )
                        : SelectRoutine(loginID: loginID, grade: grade),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "asset/images/etc/routine.png",
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  SizedBox(height: 8.0),
                  Text("루틴", style: TextStyle(fontSize: 23.0)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext ccontext) => loginID == ""
                        ? Scaffold(
                            appBar: MyAppBar(grade: grade),
                            drawer: MyDrawer(loginID: loginID, grade: grade),
                            body: AfterLogin(),
                          )
                        : SelectMyRoutine(loginID: loginID, grade: grade),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "asset/images/etc/myroutine.png",
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  SizedBox(height: 8.0),
                  Text("내 루틴", style: TextStyle(fontSize: 23.0)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
