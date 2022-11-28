import 'dart:convert';

import 'package:final_app/exercise/select_my_routine.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/ip_address.dart';

class AddRoutine extends StatefulWidget {
  final loginID;
  final grade;
  const AddRoutine({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<AddRoutine> createState() => _AddRoutineState();
}

class _AddRoutineState extends State<AddRoutine> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                hintText: '루틴 이름을 입력해주세요',
                border: InputBorder.none,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[widget.grade],
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[widget.grade],
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '취소',
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[widget.grade],
                  elevation: 0,
                ),
                onPressed: () async {
                  var url = Uri.http(
                      IP_ADDRESS, '/test_add_routine.php', {'q': '{http}'});
                  var response = await http.post(url, body: <String, String>{
                    "nickname": widget.loginID.toString(),
                    "routineName": _controller.text.toString(),
                  });
                  var jsondata =
                      jsonDecode(json.decode(json.encode(response.body)));
                  if (jsondata == "Success")
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => SelectMyRoutine(
                            loginID: widget.loginID, grade: widget.grade),
                      ),
                    );
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
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
