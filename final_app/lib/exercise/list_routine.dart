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
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 16.0),
            for (int i = 0; i < widget.data.result!.length; i++)
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
                        color: PRIMARY_COLOR[widget.grade],
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Text(
                        '(${widget.data.result![i].time}분) ${widget.data.result![i].routine}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                onTap: () async {
                  print(widget.data.result![i].time);
                  print(widget.data.result![i].routine);

                  var url = Uri.http(IP_ADDRESS,
                      '/test_select_routine_detail.php', {'q': '{http}'});
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
