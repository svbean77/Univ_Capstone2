import 'dart:convert';

import 'package:final_app/exercise/list_my_exercise.dart';
import 'package:final_app/screen/const/const_exercise_info.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../screen/const/db_class.dart';
import '../../screen/const/ip_address.dart';

class AddExercise extends StatefulWidget {
  final loginID;
  final jsonlst;
  final routine;
  final grade;
  const AddExercise({
    required this.loginID,
    required this.jsonlst,
    required this.routine,
    required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

enum UnitItems { numbers, times }

class _AddExerciseState extends State<AddExercise> {
  String? selectedMuscle;
  String? selectedExercise;
  int jsonIdx = -1;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, int> mapExNum = {
      "이두": 1,
      "가슴": 2,
      '대퇴 사두근': 3,
      '승모근': 4,
      '삼두': 5,
      '어깨': 6,
      '광배근': 7,
      '대퇴 이두근': 8,
      '둔근': 9,
      '전완근': 10,
      '종아리': 11,
      '복근': 12,
      '등 하부': 13,
      '등 중앙부': 14,
      '복사근': 15
    };

    return Container(
      height: 400.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '운동 추가하기',
            style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
          ),
          FormField(builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('근육을 선택해주세요', style: TextStyle(fontSize: 18.0)),
                  value: selectedMuscle,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMuscle = newValue!;
                      selectedExercise = null;
                      jsonIdx = mapExNum[selectedMuscle]! - 1;
                    });
                  },
                  items: muscleLst.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          }),
          FormField(builder: (FormFieldState<String> state) {
            List<String> exerciseLst = [];

            if (jsonIdx != -1) {
              var jsondata = widget.jsonlst[jsonIdx];
              ALL_EXERCISE data = ALL_EXERCISE.fromJson(jsondata);
              for (int i = 0; i < data.result!.length; i++) {
                exerciseLst.add(data.result![i].exercise.toString());
              }
            }

            return InputDecorator(
              decoration: InputDecoration(),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('운동을 선택해주세요', style: TextStyle(fontSize: 18.0)),
                  value: selectedExercise,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedExercise = newValue!;
                    });
                  },
                  items: exerciseLst.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          }),
          Text('횟수 및 시간',
              style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      hintText: 'ex. 10~12회',
                      hintStyle: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
              ],
            ),
          ),
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
                child: MyText(text: "취소", grade: widget.grade),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[widget.grade],
                  elevation: 0,
                ),
                onPressed: () async {
                  print(_controller.text.toString());
                  print(_controller.text.toString().length);
                  print(selectedExercise);
                  if (_controller.text.toString() != "" &&
                      selectedExercise != null) {
                    var url =
                        Uri.parse("http://${IP_ADDRESS}/test_add_exercise.php");
                    /*
                    var url = Uri.http(
                        IP_ADDRESS, '/test_add_exercise.php', {'q': '{http}'});

                     */
                    var response = await http.post(url, body: <String, String>{
                      "nickname": widget.loginID.toString(),
                      "routine": widget.routine.toString(),
                      "exercise": selectedExercise.toString(),
                      "num": _controller.text.toString(),
                    });
                    var jsondata = json.decode(json.encode(response.body));
                    if (jsondata.toString() == "Success")
                      Navigator.of(context).pop();
                  } else {
                    MyToast(
                        '모든 칸을 채워주세요.',
                        PRIMARY_COLOR[widget.grade],
                        (widget.grade == 0 ||
                                widget.grade == 1 ||
                                widget.grade == 2 ||
                                widget.grade == 4 ||
                                widget.grade == 8)
                            ? Colors.black
                            : Colors.white);
                  }
                },
                child: MyText(text: "확인", grade: widget.grade),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
