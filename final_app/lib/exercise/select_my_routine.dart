import 'dart:async';
import 'dart:convert';

import 'package:final_app/exercise/const/add_routine.dart';
import 'package:final_app/exercise/list_my_exercise.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/db_class.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/const/ip_address.dart';

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
  StreamController controller = StreamController();
  Timer? _timer;

  Future getDatas() async {
    var url = Uri.parse("http://${IP_ADDRESS}/test_select_my_routine.php");
    /*
    var url =
        Uri.http(IP_ADDRESS, '/test_select_my_routine.php', {'q': '{http}'});

     */
    var response = await http.post(url, body: <String, String>{
      "nickname": widget.loginID.toString(),
    });
    var jsondata = jsonDecode(json.decode(json.encode(response.body)));
    MY_ROUTINE_LIST data = MY_ROUTINE_LIST.fromJson(jsondata);

    controller.add(data);
  }

  @override
  void initState() {
    getDatas();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => getDatas());
    super.initState();
  }

  @override
  void dispose() {
    if (_timer!.isActive) _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.result!);
          }
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
                      content: AddRoutine(
                          loginID: widget.loginID, grade: widget.grade),
                      scrollable: true,
                    );
                  },
                );
              },
              backgroundColor: PRIMARY_COLOR[widget.grade],
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: snapshot.hasData
                  ? ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '내 루틴 만들기',
                              style: TextStyle(
                                  fontSize: 28.0, fontWeight: FontWeight.bold),
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
                                            Text('오른쪽에서 왼쪽으로 밀면\n루틴이 삭제됩니다!',
                                                textAlign: TextAlign.center,
                                                style:
                                                    TextStyle(fontSize: 18.0)),
                                            SizedBox(height: 8.0),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: MyText(
                                                  text: "확인",
                                                  grade: widget.grade),
                                              style: ElevatedButton.styleFrom(
                                                  primary: PRIMARY_COLOR[
                                                      widget.grade],
                                                  elevation: 0),
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
                        snapshot.data.result!.length == 0
                            ? Center(
                                child: Text('루틴이 없습니다.', style: TextStyle(fontSize: 18.0)),
                              )
                            : Container(),
                        for (int i = 0; i < snapshot.data.result!.length; i++)
                          Dismissible(
                            key: ObjectKey(snapshot.data.result![i].id),
                            direction: DismissDirection.endToStart,
                            onDismissed: (DismissDirection direction) async {
                              var url = Uri.parse(
                                  "http://${IP_ADDRESS}/test_remove_routine.php");
                              /*
                              var url = Uri.http(IP_ADDRESS,
                                  '/test_remove_routine.php', {'q': '{http}'});

                               */
                              var response =
                                  await http.post(url, body: <String, String>{
                                "nickname": widget.loginID.toString(),
                                "routine":
                                    snapshot.data.result![i].routine.toString(),
                              });
                              var jsondata =
                                  json.decode(json.encode(response.body));
                            },
                            child: GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: MyContainer(
                                  height: 70.0,
                                  width: double.infinity,
                                  grade: widget.grade,
                                  child: Text(
                                    snapshot.data!.result![i]!.routine,
                                    style: TextStyle(fontSize: 23.0),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ListMyExercise(
                                      routine:
                                          snapshot.data!.result![i]!.routine,
                                      loginID: widget.loginID,
                                      grade: widget.grade,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 8.0),
                        Text('데이터를 불러오고 있습니다..'),
                      ],
                    ),
            ),
          );
        });
  }
}
