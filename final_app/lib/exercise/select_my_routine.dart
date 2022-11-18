import 'package:final_app/exercise/const/add_routine.dart';
import 'package:final_app/exercise/list_my_exercise.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class SelectMyRoutine extends StatefulWidget {
  final loginID;
  const SelectMyRoutine({
    required this.loginID,
    Key? key,
  }) : super(key: key);

  @override
  State<SelectMyRoutine> createState() => _SelectMyRoutineState();
}

class _SelectMyRoutineState extends State<SelectMyRoutine> {
  @override
  Widget build(BuildContext context) {
    //데이터 길이만큼 for문 반복, 루틴 이름, 시간만 가져오면 됨
    int grade = 5;
    List<String> routineName = ['루틴1', '루틴2', '루틴3', '루틴4'];

    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID),
      appBar: MyAppBar(grade: grade),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,
            color: (grade == 0 ||
                    grade == 1 ||
                    grade == 2 ||
                    grade == 4 ||
                    grade == 8)
                ? Colors.black
                : Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: AddRoutine(loginID: widget.loginID),
                scrollable: true,
              );
            },
          );
          //db에 루틴을 추가하는 코드
          //ListView를 실시간으로 바꿀 수 있도록 코드 수정
        },
        backgroundColor: PRIMARY_COLOR[grade],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '내 루틴 만들기',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 30.0),
            for (int i = 0; i < routineName.length; i++)
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 70.0,
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PRIMARY_COLOR[grade],
                      ),
                    ),
                    child: Text(
                      routineName[i],
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                onTap: () {
                  //여기서 구해야하나
                  //String name = '루틴이름1';

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ListMyExercise(
                        routineName: routineName[i],
                        loginID: widget.loginID,
                      ),
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
