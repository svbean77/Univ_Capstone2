import 'dart:convert';

import 'package:final_app/exercise/list_routine.dart';
import 'package:final_app/screen/const/db_class.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/ip_address.dart';

class SelectRoutineContainer extends StatelessWidget {
  final loginID;
  final title;
  final grade;
  final time;
  const SelectRoutineContainer({
    required this.loginID,
    required this.grade,
    required this.title,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0, top: 10.0, bottom: 10.0),
      child: GestureDetector(
        child: Container(
          height: 100.0,
          width: 100.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: PRIMARY_COLOR[grade].withOpacity(0.5),
            ),
            color: PRIMARY_COLOR[grade].withOpacity(0.2),
          ),
          child: Text(title, style: TextStyle(fontSize: 18.0)),
        ),
        onTap: () async {
          var url = Uri.parse("http://${IP_ADDRESS}/test_select_routine.php");
          /*
          var url =
              Uri.http(IP_ADDRESS, '/test_select_routine.php', {'q': '{http}'});

           */
          var response = await http.post(url, body: <String, String>{
            "part": title.toString(),
            "time": time.toString(),
          });

          var jsondata = jsonDecode(json.decode(json.encode(response.body)));
          ROUTINE_LIST data = ROUTINE_LIST.fromJson(jsondata);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ListRoutine(
                  title: title, loginID: loginID, grade: grade, data: data),
            ),
          );
        },
      ),
    );
  }
}
