import 'dart:convert';

import 'package:final_app/exercise/const/add_exercise.dart';
import 'package:final_app/exercise/routine_guide.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/const/db_class.dart';
import '../screen/const/ip_address.dart';

class ListMyExercise extends StatefulWidget {
  final loginID;
  final routine;
  final grade;
  const ListMyExercise({
    required this.loginID,
    required this.routine,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<ListMyExercise> createState() => _ListMyExerciseState();
}

class _ListMyExerciseState extends State<ListMyExercise> {
  Future getDatas() async {
    var url = Uri.http(
        IP_ADDRESS, '/test_select_my_routine_detail.php', {'q': '{http}'});
    var response = await http.post(url, body: <String, String>{
      "nickname": widget.loginID.toString(),
      "routine": widget.routine.toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    MY_ROUTINE_DETAIL data = MY_ROUTINE_DETAIL.fromJson(jsondata);
    return data;
  }

  @override
  Widget build(BuildContext context) {
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
    return FutureBuilder(
        future: getDatas(),
        builder: (context, snapshot) {
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
                var url =
                    Uri.http(IP_ADDRESS, '/all_exercise.php', {'q': '{http}'});
                for (int i = 1; i <= 15; i++) {
                  var response = await http.post(url, body: <String, String>{
                    "muscle": mapExNum[i].toString(),
                  });
                  jsonlst
                      .add(jsonDecode(json.decode(json.encode(response.body))));
                }

                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: AddExercise(
                        loginID: widget.loginID,
                        jsonlst: jsonlst,
                        routine: widget.routine,
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
              child: snapshot.hasData
                  ? Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              Text(
                                widget.routine,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '오른쪽에서 왼쪽으로 밀면\n운동이 삭제됩니다!',
                                                    textAlign:
                                                        TextAlign.center),
                                                SizedBox(height: 8.0),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: MyText(text: "확인", grade: widget.grade),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: PRIMARY_COLOR[
                                                        widget.grade],
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
                              snapshot.data.result!.length == 0
                                  ? Center(
                                      child: Text('운동이 없습니다.'),
                                    )
                                  : Container(),
                              for (int i = 0;
                                  i < snapshot.data.result!.length;
                                  i++)
                                Dismissible(
                                  key: ObjectKey(snapshot.data.result![i].id),
                                  direction: DismissDirection.endToStart,
                                  onDismissed:
                                      (DismissDirection direction) async {
                                    var url = Uri.http(
                                        IP_ADDRESS,
                                        '/test_remove_exercise.php',
                                        {'q': '{http}'});
                                    var response = await http
                                        .post(url, body: <String, String>{
                                      "nickname": widget.loginID.toString(),
                                      "id": snapshot.data.result![i].id
                                          .toString(),
                                      "routine": widget.routine.toString(),
                                    });
                                    var jsondata = jsonDecode(json
                                        .decode(json.encode(response.body)));
                                    if (jsondata == "Success")
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ListMyExercise(
                                            loginID: widget.loginID,
                                            routine: widget.routine,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            snapshot.data.result![i].exercise,
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          Text(snapshot.data.result![i].num),
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => RoutineGuide(
                                  data: snapshot.data.result!,
                                  loginID: widget.loginID,
                                  grade: widget.grade,
                                ),
                              ),
                            );
                          },
                          child: MyText(text: "운동 시작", grade: widget.grade),
                        ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        });
  }
}
