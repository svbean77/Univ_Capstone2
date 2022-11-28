import 'package:final_app/exercise/const/add_routine.dart';
import 'package:final_app/exercise/list_my_exercise.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class SelectMyRoutine extends StatefulWidget {
  final loginID;
  final grade;
  const SelectMyRoutine({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<SelectMyRoutine> createState() => _SelectMyRoutineState();
}

class _SelectMyRoutineState extends State<SelectMyRoutine> {
  @override
  Widget build(BuildContext context) {
    /*
    select: loginID를 이용해 내루틴 select -> class
     */
    List<String> routineName = [
      '루틴1',
      '루틴2이름아주길고매우길고진짜진짜길어서한100줄은될것같은데그렇게까지쓰기는힘드니까어느정도만해보는루틴이름',
      '루틴3',
      '루틴4'
    ];
    List<int> routineNum = [1, 2, 3, 4];

    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      appBar: MyAppBar(grade: widget.grade),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.add,
            color: (widget.grade == 0 ||
                widget.grade == 1 ||
                widget.grade == 2 ||
                widget.grade == 4 ||
                widget.grade == 8)
                ? Colors.black
                : Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content:
                AddRoutine(loginID: widget.loginID, grade: widget.grade),
                scrollable: true,
              );
            },
          );
        },
        backgroundColor: PRIMARY_COLOR[widget.grade],
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
                                Text('오른쪽에서 왼쪽으로 밀면\n루틴이 삭제됩니다!',
                                    textAlign: TextAlign.center),
                                SizedBox(height: 8.0),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    '확인',
                                    style: TextStyle(
                                        color: (widget.grade == 0 ||
                                            widget.grade == 1 ||
                                            widget.grade == 2 ||
                                            widget.grade == 4 ||
                                            widget.grade == 8)
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: PRIMARY_COLOR[widget.grade],
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
                /*
                //key를 뭐로 설정해야 하는지 확인 [i]를 껴야돼 말아야돼? seperate로 하면 [i]를 안써도 되는 것 같긴 함
                key는 루틴번호로 일단 설정해봄
                 */
                key: ObjectKey(routineNum),
                direction: DismissDirection.endToStart,
                onDismissed: (DismissDirection direction) {
                  /*
                  delete: 루틴 삭제하는 코드
                  (굳이 key 사용할 필요 없이 for문 i 사용하면 되는거 아니야? num = routineNum[i]인 요소 삭제!)
                   */
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => SelectMyRoutine(
                          loginID: widget.loginID, grade: widget.grade),
                    ),
                  );
                },
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      width: double.infinity,
                      padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PRIMARY_COLOR[widget.grade],
                        ),
                      ),
                      child: IntrinsicHeight(
                        child: Text(
                          routineName[i],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    /*
                    위에서 구한 json->class를 이용해 루틴 상세를 select, class 형태로? 전달
                    ## 위의 json: 루틴번호 생성아이디 루틴이름
                    ## 여기 json: 운동번호 생성아이디 루틴이름 운동이름 횟수 시간이냐 사진1 사진2 운동단계
                     */
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ListMyExercise(
                          routineName: routineName[i],
                          loginID: widget.loginID,
                          grade: widget.grade,
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
