import 'dart:convert';

import 'package:final_app/exercise/const/add_exercise.dart';
import 'package:final_app/exercise/routine_guide.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/const/ip_address.dart';

class ListMyExercise extends StatefulWidget {
  final loginID;
  final String routineName;
  const ListMyExercise({
    required this.loginID,
    required this.routineName,
    Key? key,
  }) : super(key: key);

  @override
  State<ListMyExercise> createState() => _ListMyExerciseState();
}

class _ListMyExerciseState extends State<ListMyExercise> {
  @override
  Widget build(BuildContext context) {
    //운동 이름 등 db에서 select
    List<String> exerciseName = ['운동1', '운동2', '운동3', '운동4'];
    List<int> exerciseNum = [1, 2, 3, 4];
    List<int> number = [15, 10, 12, 20];
    //횟수랑 시간은 어떻게 구분할 것인가?
    //db 속성으로 횟수 t/f를 만들고 t이면 회, f이면 초로 단위를 추가
    List<String> isTime = ['f', 'f', 'f', 't'];
    int grade = 5;
    Map<int, String> mapExNum = {
      1: "이두",
      2: "가슴",
      3: '대퇴 사두근',
      4: '승모근',
      5: '삼두',
      6: '어깨',
      7: '광배근',
      8: '대퇴 이두근',
      9: '둔근',
      10: '전완근',
      11: '종아리',
      12: '복근',
      13: '등 하부',
      14: '등 중앙부',
      15: '복사근'
    };
    String numberUnit(String boolean) {
      String unit = (boolean == 't') ? '초' : '회';

      return unit;
    }

    var tmpdata = getTestJson();
    print(tmpdata);

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
        onPressed: () async {
          //db에 운동을 추가하는 코드
          List<dynamic> jsonlst = [];
          var url = Uri.http(IP_ADDRESS, '/all_exercise.php', {'q': '{http}'});
          for (int i = 1; i <= 15; i++) {
            var response = await http.post(url, body: <String, String>{
              "muscle": mapExNum[i].toString(),
            });
            jsonlst.add(jsonDecode(json.decode(json.encode(response.body))));
          }

          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: AddExercise(
                    loginID: widget.loginID,
                    jsonlst: jsonlst,
                    routineName: widget.routineName),
                scrollable: true,
              );
            },
          );
        },
        backgroundColor: PRIMARY_COLOR[grade],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.routineName,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('오른쪽에서 왼쪽으로 밀면\n운동이 삭제됩니다!',
                                          textAlign: TextAlign.center),
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
                  for (int i = 0; i < exerciseName.length; i++)
                    Dismissible(
                      key: ObjectKey(exerciseNum),
                      direction: DismissDirection.endToStart,
                      onDismissed: (DismissDirection direction) {
                        //db에서 삭제하는 php 코드
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => ListMyExercise(
                                loginID: widget.loginID,
                                routineName: widget.routineName),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            //db 횟수를 변경하는 코드 작성
                            //ListView를 실시간으로 바꿀 수 있도록 코드 수정
                          },
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  exerciseName[i],
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                    '${number[i].toString()}${numberUnit(isTime[i])}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR[grade],
                elevation: 0,
              ),
              onPressed: () {
                String exerciseStep = '운동방법';
                String exerciseImage1 =
                    "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";
                String exerciseImage2 =
                    "https://www.musclewiki.com/media/uploads/male-dumbbell-hammercurl-front.gif";

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => RoutineGuide(
                        routineName: widget.routineName,
                        exerciseName: exerciseName[0],
                        exerciseStep: exerciseStep,
                        exerciseImage1: exerciseImage1,
                        exerciseImage2: exerciseImage2,
                        numberUnit: numberUnit(isTime[0]),
                        number: number[0],
                        loginID: widget.loginID),
                  ),
                );
              },
              child: Text(
                '운동시작',
                style: TextStyle(
                  color: (grade == 0 ||
                          grade == 1 ||
                          grade == 2 ||
                          grade == 4 ||
                          grade == 8)
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getTestJson() async {
    var url = Uri.http(IP_ADDRESS, '/all_exercise.php', {'q': '{http}'});
    for (int i = 1; i <= 15; i++) {
      var response = await http.post(url, body: <String, String>{
        "muscle": '이두'.toString(),
      });
      var jsondata = jsonDecode(json.decode(json.encode(response.body)));
      return jsondata;
    }
  }
}
