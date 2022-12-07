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
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: TextField(
              controller: dateController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                hintText: '날짜입력: YYYYMMDD',
                hintStyle: TextStyle(fontSize: 18.0),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
              borderRadius: BorderRadius.circular(10),
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
                hintStyle: TextStyle(fontSize: 18.0),
              ),
              keyboardType: TextInputType.number,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: PRIMARY_COLOR[grade],
              ),
              borderRadius: BorderRadius.circular(10),
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
                child: MyText(text: "취소", grade: grade),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade],
                  elevation: 0,
                ),
                onPressed: () async {
                  if (dateController.text.toString() != "" &&
                      weightController.text.toString() != "") {
                    if (dateController.text.toString().length != 8) {
                      MyToast(
                          '날짜 입력 양식을 맞춰주세요: YYYYMMDD',
                          PRIMARY_COLOR[grade],
                          (grade == 0 ||
                                  grade == 1 ||
                                  grade == 2 ||
                                  grade == 4 ||
                                  grade == 8)
                              ? Colors.black
                              : Colors.white);
                    } else {
                      String year =
                          (int.parse(dateController.text.toString()) ~/ 10000)
                              .toString();
                      String month =
                          ((int.parse(dateController.text.toString()) %
                                      10000) ~/
                                  100)
                              .toString();
                      if (month.length == 1) month = "0" + month;
                      String day =
                          (int.parse(dateController.text.toString()) % 100)
                              .toString();
                      if (day.length == 1) day = "0" + day;
                      bool isDate = true;

                      if (1 > int.parse(month) || int.parse(month) > 12) {
                        isDate = false;
                      } else if ([1, 3, 5, 7, 8, 10, 12]
                          .contains(int.parse(month))) {
                        if (1 > int.parse(day) || int.parse(day) > 31)
                          isDate = false;
                      } else if ([4, 6, 9, 11].contains(int.parse(month))) {
                        if (1 > int.parse(day) || int.parse(day) > 30)
                          isDate = false;
                      } else {
                        int leapday = 28;
                        if ((int.parse(year) % 4 == 0) &&
                                (int.parse(year) % 100 != 0) ||
                            (int.parse(year) % 400 == 0)) leapday = 29;

                        if (1 > int.parse(day) || int.parse(day) > leapday)
                          isDate = false;
                      }
                      if (isDate) {
                        var url = Uri.parse(
                            "http://${IP_ADDRESS}/test_add_weight_record.php");
                        /*
                        var url = Uri.http(IP_ADDRESS,
                            '/test_add_weight_record.php', {'q': '{http}'});

                         */
                        var response =
                            await http.post(url, body: <String, String>{
                          "nickname": loginID.toString(),
                          "writeDate": dateController.text.toString(),
                          "weight": weightController.text.toString(),
                        });
                        var jsondata = json.decode(json.encode(response.body));
                        if (jsondata.toString() == "Success")
                          Navigator.of(context).pop();
                      } else {
                        MyToast(
                            '유효하지 않은 날짜입니다.',
                            PRIMARY_COLOR[grade],
                            (grade == 0 ||
                                    grade == 1 ||
                                    grade == 2 ||
                                    grade == 4 ||
                                    grade == 8)
                                ? Colors.black
                                : Colors.white);
                      }
                    }
                  } else {
                    MyToast(
                        '모든 칸을 채워주세요.',
                        PRIMARY_COLOR[grade],
                        (grade == 0 ||
                                grade == 1 ||
                                grade == 2 ||
                                grade == 4 ||
                                grade == 8)
                            ? Colors.black
                            : Colors.white);
                  }
                },
                child: MyText(text: "확인", grade: grade),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
