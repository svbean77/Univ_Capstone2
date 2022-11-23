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
    List<int> routineNum = [1, 2, 3, 4];

    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID),
      appBar: MyAppBar(grade: grade),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '내 루틴 만들기',
                  style: TextStyle(fontSize: 25.0),
                ),
                GestureDetector(
                  child: Icon(Icons.question_mark),
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            height: 120.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('오른쪽에서 왼쪽으로 밀면\n루틴이 삭제됩니다!', textAlign: TextAlign.center),
                                SizedBox(height: 8.0),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    '확인',
                                    style: TextStyle(
                                        color: (grade == 0 ||
                                                grade == 1 ||
                                                grade == 2 ||
                                                grade == 4 ||
                                                grade == 8)
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: PRIMARY_COLOR[grade],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          scrollable: true,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            for (int i = 0; i < routineName.length; i++)
              Dismissible(
                key: ObjectKey(
                    routineNum), //key를 뭐로 설정해야 하는지 확인 [i]를 껴야돼 말아야돼? seperate로 하면 [i]를 안써도 되는 것 같긴 함
                direction: DismissDirection.endToStart,
                onDismissed: (DismissDirection direction) {
                  //db에서 삭제하는 php 코드
                },
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
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
              ),
          ],
        ),
      ),
    );
  }
}
