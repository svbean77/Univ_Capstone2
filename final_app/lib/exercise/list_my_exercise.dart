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
  /*
  json, class 둘 중 뭔가로 전달했다고 가정
   */
  final loginID;
  final String routineName;
  final grade;
  const ListMyExercise({
    required this.loginID,
    required this.routineName,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<ListMyExercise> createState() => _ListMyExerciseState();
}

class _ListMyExerciseState extends State<ListMyExercise> {
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

  @override
  Widget build(BuildContext context) {
    List<String> exerciseName = [
      '바벨 프론트 스쿼트 바디빌딩',
      '덤벨 고블렛 불가리아 스플릿 스쿼트',
      '케틀벨 오스탠딩 트라이셉스 익스텐션',
      '운동4'
    ];
    List<int> exerciseNum = [1, 2, 3, 4];
    List<int> number = [15, 10, 12, 20];
    List<String> isTime = ['f', 'f', 'f', 't'];

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
        onPressed: () async {
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
                  routineName: widget.routineName,
                  grade: widget.grade,
                ),
                scrollable: true,
              );
            },
          );
        },
        backgroundColor: PRIMARY_COLOR[widget.grade],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    widget.routineName,
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
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
                  ),
                  SizedBox(height: 16.0),
                  for (int i = 0; i < exerciseName.length; i++)
                    Dismissible(
                      key: ObjectKey(exerciseNum),
                      direction: DismissDirection.endToStart,
                      onDismissed: (DismissDirection direction) {
                        /*
                        delete: 운동번호를 이용해 삭제
                        (굳이 key 신경 안쓰고 db에서 select해도 될 듯???)
                         */
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => ListMyExercise(
                              loginID: widget.loginID,
                              routineName: widget.routineName,
                              grade: widget.grade,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          width: double.infinity,
                          height: 70.0,
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PRIMARY_COLOR[widget.grade],
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
                ],
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR[widget.grade],
                elevation: 0,
              ),
              onPressed: () {
                /*
                class로 전달 or list로 바꿔 전달
                 */
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
                      loginID: widget.loginID,
                      grade: widget.grade,
                    ),
                  ),
                );
              },
              child: Text(
                '운동시작',
                style: TextStyle(
                  color: (widget.grade == 0 ||
                      widget.grade == 1 ||
                      widget.grade == 2 ||
                      widget.grade == 4 ||
                      widget.grade == 8)
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
}
