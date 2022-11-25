import 'package:final_app/exercise/const/select_routine_container.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/const_exercise_info.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:flutter/material.dart';

class SelectRoutine extends StatefulWidget {
  final loginID;
  const SelectRoutine({
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  State<SelectRoutine> createState() => _SelectRoutineState();
}

class _SelectRoutineState extends State<SelectRoutine> {
  @override
  Widget build(BuildContext context) {
    int grade = 5;

    List<String> timeLst = ['15분', '30분', '60분', '90분', '120분'];
    List<String> divisionLst = ['무분할', '2분할', '3분할', '4분할'];

    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID),
      appBar: MyAppBar(grade: grade),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '루틴 선택',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '시간별 루틴 선택',
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < timeLst.length; i++)
                    SelectRoutineContainer(
                        title: timeLst[i],
                        grade: grade,
                        loginID: widget.loginID)
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '부위별 루틴 선택',
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
              height: 360.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < muscleLst.length ~/ 3; i++)
                    Column(
                      children: [
                        SelectRoutineContainer(
                            title: muscleLst[i * 3],
                            grade: grade,
                            loginID: widget.loginID),
                        SelectRoutineContainer(
                            title: muscleLst[i * 3 + 1],
                            grade: grade,
                            loginID: widget.loginID),
                        SelectRoutineContainer(
                            title: muscleLst[i * 3 + 2],
                            grade: grade,
                            loginID: widget.loginID),
                      ],
                    )
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '분할별 루틴 선택',
              style: TextStyle(fontSize: 20.0),
            ),
            Container(
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < divisionLst.length; i++)
                    SelectRoutineContainer(
                        title: divisionLst[i],
                        grade: grade,
                        loginID: widget.loginID)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
