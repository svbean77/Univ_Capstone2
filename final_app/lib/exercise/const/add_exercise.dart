import 'package:final_app/screen/const/const_exercise_info.dart';
import 'package:final_app/screen/const/grade_colors.dart';
import 'package:flutter/material.dart';

class AddExercise extends StatefulWidget {
  final loginID;
  const AddExercise({
    required this.loginID,
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
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            //해당 근육에 따른 운동 리스트를 골라와야함
            List<String> exerciseLst = [];
            //selectedMuscle을 통해 php문을 실행하고 운동 종류를 불러옴
            if (selectedMuscle == '이두')
              exerciseLst = ['아두 운동1', '이두 운동2', '이두 운동3'];
            else if (selectedMuscle == '종아리')
              exerciseLst = ['종아리 운동7', '종아리 운동8'];
            else
              exerciseLst = ['그냥운동1', '그냥운동2', '그냥운동3', '그냥운동4', '그냥운동5'];

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade],
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '취소',
                  style: TextStyle(
                    fontSize: 20.0,
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
              SizedBox(width: 30.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR[grade],
                ),
                onPressed: () {
                  //db에 루틴 추가하는 코드 작성
                  //추가됨에 따라 실시간으로 화면에 추가
                  if (units[1] == true) {
                    //시간으로 db에 저장
                  } else if (units[0] == true) {
                    //횟수로 db에 저장
                  }
                  Navigator.of(context).pop();
                },
                child: Text(
                  '추가',
                  style: TextStyle(
                    fontSize: 20.0,
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
