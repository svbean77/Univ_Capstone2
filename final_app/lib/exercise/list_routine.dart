import 'dart:convert';

import 'package:final_app/exercise/list_exercise.dart';
import 'package:final_app/screen/const/app_bar.dart';
import 'package:final_app/screen/const/db_class.dart';
import 'package:final_app/screen/const/drawer.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/const/ip_address.dart';

class ListRoutine extends StatefulWidget {
  final loginID;
  final title;
  final grade;
  final data;
  const ListRoutine({
    required this.title,
    required this.loginID,
    required this.grade,
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<ListRoutine> createState() => _ListRoutineState();
}

class _ListRoutineState extends State<ListRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(loginID: widget.loginID, grade: widget.grade),
      appBar: MyAppBar(grade: widget.grade),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '${widget.title} 루틴 선택',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            widget.data.result!.length == 0
                ? Center(
                    child: Text('루틴이 없습니다.', style: TextStyle(fontSize: 18.0)),
                  )
                : Container(),
            for (int i = 0; i < widget.data.result!.length; i++)
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 70.0,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: PRIMARY_COLOR[widget.grade].withOpacity(0.5),
                      ),
                      color: Colors.white,
                    ),
                    child: Text(
                      '(${widget.data.result![i].time}분) ${widget.data.result![i].routine}',
                      style: TextStyle(fontSize: 23.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                onTap: () async {
                  print(widget.data.result![i].time);
                  print(widget.data.result![i].routine);

                  var url = Uri.parse(
                      "http://${IP_ADDRESS}/test_select_routine_detail.php");
                  /*
                  var url = Uri.http(IP_ADDRESS,
                      '/test_select_routine_detail.php', {'q': '{http}'});

                   */
                  var response = await http.post(url, body: <String, String>{
                    "routine": widget.data.result![i].routine.toString(),
                  });

                  var jsondata =
                      jsonDecode(json.decode(json.encode(response.body)));
                  ROUTINE_DETAIL data = ROUTINE_DETAIL.fromJson(jsondata);
                  print(data.result!.length);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ListExercise(
                        data: data.result!,
                        loginID: widget.loginID,
                        grade: widget.grade,
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
