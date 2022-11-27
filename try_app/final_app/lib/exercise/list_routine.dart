import 'package:final_app/exercise/list_exercise.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class ListRoutine extends StatefulWidget {
  final loginID;
  final title;
  const ListRoutine({
    required this.title,
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  State<ListRoutine> createState() => _ListRoutineState();
}

class _ListRoutineState extends State<ListRoutine> {
  @override
  Widget build(BuildContext context) {
    /*
    select: 사용자 선택 테마
     */
    /*
    select: 여기서 데이터 구하기 도전! title이 목적, 이것을 이용해 select
    만약 된다면 json->class까지!
     */
    int grade = 5;
    List<String> routineName = [
      '루틴1',
      '루틴2',
      '루틴3',
      '루틴4이름완전대박짱길어이렇게하면넘어가는데어떻게되는거지',
    ];
    List<int> routineTime = [15, 20, 25, 30];

    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID),
      appBar: MyAppBar(grade: grade),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '${widget.title} 루틴 선택',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 16.0),
            for (int i = 0; i < routineName.length; i++)
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PRIMARY_COLOR[grade],
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Text(
                        '(${routineTime[i]}분) ${routineName[i]}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  /*
                  json 파일을 통째로 보내기! (운동이 몇 개가 있는지 모르니까)
                  or class로 변형한 형태로 보내기(로 도전해보자! json을 하면 뒤에서 또 까야 함.)
                  class 형태 통째로 보내기 (data.result 보내기?)
                   */
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ListExercise(
                          routineName: routineName[i], loginID: widget.loginID),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
