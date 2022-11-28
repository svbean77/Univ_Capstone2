import 'dart:convert';

import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/ip_address.dart';

class AddRecord extends StatelessWidget {
  final loginID;
  final grade;
  final selectedDate;
  const AddRecord({
    required this.loginID,
    required this.grade,
    required this.selectedDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    String year = selectedDate.year.toString();
    String month = selectedDate.month.toString();
    String day = selectedDate.day.toString();

    return Container(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$year.$month.$day 기록 추가', style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 8.0),
          Container(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                border: InputBorder.none,
              ),
              maxLines: 7,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade],
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '취소',
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade],
                  elevation: 0,
                ),
                onPressed: () async {
                  String date = year + month + day;
                  print(date);

                  var url = Uri.http(IP_ADDRESS,
                      '/test_add_exercise_record.php', {'q': '{http}'});
                  var response = await http.post(url, body: <String, String>{
                    "nickname": loginID.toString(),
                    "writeDate": date.toString(),
                    "comment": controller.text.toString(),
                  });
                  var jsondata =
                      jsonDecode(json.decode(json.encode(response.body)));
                  if (jsondata == "Success") Navigator.of(context).pop();
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
