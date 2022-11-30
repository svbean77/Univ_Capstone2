import 'dart:convert';

import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/ip_address.dart';

class AddWeight extends StatelessWidget {
  final loginID;
  final grade;
  const AddWeight({
    required this.loginID,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    return Container(
      height: 180.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: TextField(
              controller: dateController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                hintText: '날짜입력: YYYYMMDD',
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            child: TextField(
              controller: weightController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                hintText: '체중입력',
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
            ),
          ),
          SizedBox(height: 16.0),
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
                  if (dateController.text.toString().length != 8) {
                    Fluttertoast.showToast(
                      msg: '입력 양식을 맞춰주세요: YYYYMMDD',
                      backgroundColor: PRIMARY_COLOR[grade],
                      textColor: (grade == 0 ||
                              grade == 1 ||
                              grade == 2 ||
                              grade == 4 ||
                              grade == 8)
                          ? Colors.black
                          : Colors.white,
                      toastLength: Toast.LENGTH_SHORT,
                    );
                  } else {
                    var url = Uri.http(IP_ADDRESS,
                        '/test_add_weight_record.php', {'q': '{http}'});
                    var response = await http.post(url, body: <String, String>{
                      "nickname": loginID.toString(),
                      "writeDate": dateController.text.toString(),
                      "weight": weightController.text.toString(),
                    });
                    var jsondata =
                        jsonDecode(json.decode(json.encode(response.body)));
                    if (jsondata == "Success") Navigator.of(context).pop();
                  }
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
