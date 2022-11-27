import 'package:final_app/exercise/list_my_exercise.dart';
import 'package:final_app/screen/const/const_exercise_info.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

import '../../screen/const/db_class.dart';

class AddExercise extends StatefulWidget {
  final loginID;
  final jsonlst;
  final routineName;
  const AddExercise({
    required this.loginID,
    required this.jsonlst,
    required this.routineName,
    Key? key,
  }) : super(key: key);

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

enum UnitItems { numbers, times }

class _AddExerciseState extends State<AddExercise> {
  String? selectedMuscle;
  String? selectedExercise;
  UnitItems? selectedUnit = UnitItems.numbers;
  List<bool> units = <bool>[true, false];
  int jsonIdx = -1;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /*
    select: 사용자 테마 선택
     */
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
    int grade = 5;
    return Container(
      height: 400.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '운동 추가하기',
            style: TextStyle(fontSize: 20.0),
          ),
          FormField(builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('근육을 선택해주세요'),
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
                  hint: Text('운동을 선택해주세요'),
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
          Text('횟수 및 시간 선택', style: TextStyle(fontSize: 20.0)),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      hintText: '횟수 및 시간',
                    ),
                  ),
                  height: 50.0,
                  width: MediaQuery.of(context).size.width / 3,
                ),
                ToggleButtons(
                  children: [
                    Text('횟수'),
                    Text('시간'),
                  ],
                  isSelected: units,
                  selectedColor: Colors.black,
                  fillColor: (grade == 0 || grade == 7)
                      ? Colors.black.withOpacity(0.1)
                      : PRIMARY_COLOR[grade].withOpacity(0.3),
                  onPressed: (value) {
                    setState(() {
                      if (value == 0) {
                        units[0] = true;
                        units[1] = false;
                      } else {
                        units[0] = false;
                        units[1] = true;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
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
                onPressed: () {
                  print(widget.routineName);
                  print(selectedMuscle);
                  print(selectedExercise);
                  if (units[1] == true) {
                    /*
                    insert: 시간이냐?를 t로 db에 저장
                    db는 loginID, 루틴이름을 이용해 선택 (where절 조건)
                     */
                  } else if (units[0] == true) {
                    /*
                    insert: 시간이냐?를 f로 db에 저장
                    db는 loginID, 루틴이름을 이용해 선택 (where절 조건)
                     */
                  }
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => ListMyExercise(
                          loginID: widget.loginID,
                          routineName: widget.routineName),
                    ),
                  );
                },
                child: Text(
                  '추가',
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
