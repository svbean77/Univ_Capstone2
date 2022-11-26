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
    int grade = 5;
    //데이터 길이만큼 for문 반복, 루틴 이름, 시간만 가져오면 됨
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
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
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
                  //여기서 구해야하나
                  //String name = '루틴이름1';

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
